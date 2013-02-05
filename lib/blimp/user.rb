module Blimp
  class User < Resource
    ATTRIBUTES = %w[profile username first_name last_name email]
    READ_ONLY = %w[]

    define_attribute_methods ATTRIBUTES, READ_ONLY
  end
end
