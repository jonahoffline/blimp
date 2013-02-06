module Blimp
  class Comment < Resource
    ATTRIBUTES = %w[comment object_pk content_type]
    READ_ONLY = %w[id files user]

    define_attribute_methods ATTRIBUTES, READ_ONLY
  end
end

