require 'json'

module Blimp
  class Resource
    class << self

      def find(id, options={})
        uri = member_name
        uri += "/#{id}" if id
        parse_response API.get(uri, options)
      end

      def find_all(options={})
        uri = member_name
        parse_response API.get(uri, options), true
      end

      def parse_response(response, multiple=false)
        case response.code.to_i
        when 404
          raise Blimp::API::NotFound.new(response), "Resource was not found"
        when 403
          raise Blimp::API::Forbidden.new(response), "Forbidden"
        when 500
          raise Blimp::API::InternalServerError.new(response), "500 Internal Server error. Make sure you're sending a proper request."
        end

        return build_record(response.parsed_response) unless multiple

        resources = []
        response.parsed_response['objects'].each do |project|
          resources.push build_record(project)
        end
        return resources
      end

      def build_record(response)
        attributes = {}
        response.each_pair do |key, val|
          attributes[key] = val if @attributes.include? key
        end
        new(attributes)
      end

      def member_name
        name.split('::').last.downcase
      end


      def define_attribute_methods(attributes, read_only_attributes)
        common_attributes = %w[id date_created date_modified resource_uri]
        read_only_attributes = read_only_attributes | common_attributes
        @attributes = attributes | read_only_attributes

        @attributes.each do |name|
          define_method(name) { self[name] }
          define_method("#{name}?") {!self[name]}
          define_method("#{name}=") {|val| self[name] = val} unless read_only_attributes.include?(name)
        end
      end

      def define_readonly_attributes(attributes)
        attributes.each do |name|
          define_method(name) { self[name] }
          define_method("#{name}?") {!self[name]}
        end
      end


      def create attributes
        new(attributes)
        uri = "#{self.member_name}/"

        parse_response Blimp::API.post(uri, body: attributes.to_json)
      end

    end
    attr_accessor :attributes

    def initialize attributes = {}
      raise Error, "#{self.class} is an abstract class and cannot be instantiated" if instance_of? Resource

      @attributes = {}
      self.attributes = attributes
    end

    def []=(key,value)
      @attributes[key] = value if self.respond_to?(key)
    end

    def [](key)
      @attributes[key]
    end

    def attributes=(attributes = {})
      attributes.each_pair do |key, val|
        self[key] = val
      end
    end

    def new?
      self.id?
    end

    def save
      uri = "#{self.class.member_name}/"
      uri += "#{self.id}/" unless self.new?

      attributes = {}
      @attributes.each_pair do |key,val|
        next if self.class::READ_ONLY.include? key
        attributes[key] = val
      end
      method = self.new? ? 'post' : 'put'
      self.attributes = Blimp::API.send(method, uri, body: attributes.to_json).parsed_response
      return self
    end

  end
end
