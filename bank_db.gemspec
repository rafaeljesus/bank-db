# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'bank/version'

Gem::Specification.new do |spec|
  spec.name          = "bank_db"
  spec.version       = Bank::VERSION
  spec.authors       = ["Rafael Jesus"]
  spec.email         = ["rafaelljesus86@gmail.com"]

  spec.summary       = %q{Bank db shared in bank api}
  spec.description   = %q{Bank db shared in bank api}
  spec.homepage      = "https://github.com/rafaeljesus/bank-db"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency 'mongoid'
end
