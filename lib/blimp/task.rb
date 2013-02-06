module Blimp
  class Task < Resource
    ATTRIBUTES = %w[position goal user_rejected title project state assigned_to]
    READ_ONLY = %w[date_done created_by date_set_doing date_checked]

    define_attribute_methods ATTRIBUTES, READ_ONLY
  end
end
