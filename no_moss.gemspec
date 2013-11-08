# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'no_moss/version'

Gem::Specification.new do |spec|
  spec.name          = "no_moss"
  spec.version       = NoMoss::VERSION
  spec.authors       = ["Steve Jorgensen"]
  spec.email         = ["steve.jorgensen@livingsocial.com"]
  spec.description   = "Keep test subjects and doubles in sync to avoid false positives"
  spec.summary       = <<-EOS
Provides a means of defining object role APIs that should be consistent
between test subjects (objects under test) and test doubles (AKA mock
objects).
A role provides data that can be used to verify that a test subject
implements the role API. A role also provides a wrapper around a
test double that prevents unsupported interactions.
  EOS
  spec.homepage      = "http://code.livingsocial.net/sjorgensen"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
