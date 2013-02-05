require "blimp/api"
require "blimp/resource"

require "blimp/company"
require "blimp/comment"
require "blimp/file"
require "blimp/goal"
require "blimp/task"
require "blimp/project"
require "blimp/user"

require "blimp/version"

module Blimp
  class << self
    attr_accessor :api_key, :app_secret, :app_id, :username
  end
end
