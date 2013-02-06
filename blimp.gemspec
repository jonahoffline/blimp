# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'blimp/version'

Gem::Specification.new do |gem|
  gem.name          = "blimp"
  gem.version       = Blimp::VERSION
  gem.authors       = ["Blake Williams", "Sixteen Eighty"]
  gem.email         = ["blake@blakewilliams.me"]
  gem.description   = %q{Ruby gem that implements the Blimp Public API http://dev.getblimp.com/}
  gem.summary       = %q{Ruby bindings to the Blimp API}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency('httparty')
  gem.add_dependency('active_support')
end
