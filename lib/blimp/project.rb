module Blimp
  class Project < Resource
    ATTRIBUTES = %w[name state team date_due company]
    READ_ONLY = %w[id slug date_created date_finished date_modified date_due stats]

    define_attribute_methods ATTRIBUTES, READ_ONLY
  end
end
