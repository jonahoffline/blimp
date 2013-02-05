module Blimp
  class File < Resource
    ATTRIBUTES = %w[name versions project source]
    READ_ONLY = %w[id slug date_created date_modified created_by]

    define_attribute_methods ATTRIBUTES, READ_ONLY
  end
end

