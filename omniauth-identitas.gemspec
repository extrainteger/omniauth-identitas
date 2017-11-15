# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
$LOAD_PATH.unshift(File.expand_path("../lib/*/**", __FILE__))
require "omniauth/identitas/version"

Gem::Specification.new do |spec|
  spec.name          = "omniauth-identitas"
  spec.version       = Omniauth::Identitas::VERSION
  spec.authors       = ["yunanhelmy"]
  spec.email         = ["m.yunan.helmy@gmail.com"]

  spec.summary       = %q{Identitas Oauth2 Strategy for Omniauth}
  spec.description   = %q{Identitas Oauth2 Strategy for Omniauth}
  spec.homepage      = "https://github.com/extrainteger/omniauth-identitas"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = "https://rubygems.org/"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency 'omniauth-oauth2'

  spec.add_development_dependency "bundler", "~> 1.15"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
