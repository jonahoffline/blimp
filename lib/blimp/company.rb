module Blimp
  class Company < Resource
    ATTRIBUTES = %w[name used_projects company_users image_url used_storage]
    READ_ONLY = %w[id slug date_due]

    define_attribute_methods ATTRIBUTES, READ_ONLY
  end
end
