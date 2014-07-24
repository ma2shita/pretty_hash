# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pretty_hash/version'

Gem::Specification.new do |spec|
  spec.name          = "pretty_hash"
  spec.version       = PrettyHash::VERSION
  spec.authors       = ["Kohei MATSUSHITA"]
  spec.email         = ["ma2shita+git@ma2shita.jp"]
  spec.summary       = %q{PrettyPrint the Hash}
  spec.description   = %q{Format to the ascii table format for Hash}
  spec.homepage      = "https://github.com/ma2shita/pretty_hash"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
