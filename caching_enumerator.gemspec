# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "caching_enumerator/version"

Gem::Specification.new do |spec|
	spec.name          = "caching_enumerator"
	spec.version       = CachingEnumerator::VERSION
	spec.authors       = "cyclotron3k"

	spec.summary       = "A caching wrapper for Enumerator"
	spec.description   = "If you're putting expensive operations in Enumerator, use this to cache and re-use the results"
	spec.homepage      = "https://github.com/cyclotron3k/caching_enumerator"
	spec.license       = "MIT"

	spec.files         = `git ls-files -z`.split("\x0").reject do |f|
		f.match(%r{^(test|spec|features)/})
	end

	spec.require_paths = ["lib"]

	spec.add_development_dependency "bundler", "~> 1.15"
	spec.add_development_dependency "rake", "~> 10.0"
	spec.add_development_dependency "minitest", "~> 5.0"
end
