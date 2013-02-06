module Blimp
  class Goal < Resource
    ATTRIBUTES = %w[position date_rejected date_done user_rejected
                    title project state assigned_to]
    READ_ONLY = %w[id created_by]

    define_attribute_methods ATTRIBUTES, READ_ONLY
  end
end

