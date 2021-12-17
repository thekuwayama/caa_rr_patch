# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'caa_rr_patch/version'

Gem::Specification.new do |spec|
  spec.name          = 'caa_rr_patch'
  spec.version       = CaaRrPatch::VERSION
  spec.authors       = ['thekuwayama']
  spec.email         = ['thekuwayama@gmail.com']
  spec.summary       = 'the patch that adds CAA Resource Record'
  spec.description   = spec.summary
  spec.homepage      = 'https://github.com/thekuwayama/caa_rr_patch'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>=2.4.6'

  spec.files         = `git ls-files`.split($INPUT_RECORD_SEPARATOR)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler'
end
