module Blimp
  class Project < Resource
    ATTRIBUTES = %w[name state team date_due company]
    READ_ONLY = %w[slug date_finished date_due stats]

    define_attribute_methods ATTRIBUTES, READ_ONLY
  end
end
