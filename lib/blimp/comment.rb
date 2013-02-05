module Blimp
  class Comment < Resource
    ATTRIBUTES = %w[comment object_pk content_type]
    READ_ONLY = %w[id files date_modified user date_created]

    define_attribute_methods ATTRIBUTES, READ_ONLY
  end
end

