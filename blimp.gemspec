# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'blimp/version'

Gem::Specification.new do |gem|
  gem.name          = 'blimp'
  gem.version       = Blimp::VERSION
  gem.authors       = ['Blake Williams', 'Jonah Ruiz']
  gem.email         = ['jonah@pixelhipsters.com']
  gem.description   = %q{Ruby gem that implements the Blimp Public API http://dev.getblimp.com/}
  gem.summary       = %q{Ruby bindings to the Blimp API}
  gem.homepage      = 'https://github.com/jonahoffline/blimp'
  gem.license       = 'MIT'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ['lib']
  gem.add_dependency 'httparty', '~> 0.11.0'
end
