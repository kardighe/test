# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'giact_verification/version'

Gem::Specification.new do |spec|
  spec.name          = "giact_verification"
  spec.version       = GiactVerification::VERSION
  spec.authors       = ["George Wambold"]
  spec.email         = ["georgewambold@gmail.com"]

  spec.summary       = "A wrapper for GIACT's Verification Services that cleans up their SOAP API"
  spec.homepage      = "https://github.com/georgewambold/giact_verification"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "dry-validation", "~> 0.11.1"
  spec.add_runtime_dependency "nori", "~> 2.6.0"
  spec.add_runtime_dependency "nokogiri", "~> 1.8.2"
  spec.add_runtime_dependency "webmock", "~> 3.3.0"

  spec.add_development_dependency "bundler", "~> 1.16.1"
  spec.add_development_dependency "rake", "~> 12.3.0"
  spec.add_development_dependency "rspec", "~> 3.7.0"
  spec.add_development_dependency "pry", "~> 0.11.3"
  spec.add_development_dependency "sinatra", "~> 2.0.0"
end
