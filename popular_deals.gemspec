# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'popular_deals/version'

Gem::Specification.new do |spec|
  spec.name          = "popular_deals"
  spec.version       = PopularDeals::VERSION
  spec.authors       = ["'Hima Chitalia'"]
  spec.email         = ["'hima_chhag@yahoo.com'"]

  spec.summary       = %q{It displays popular deals of the day from https://slickdeals.net/deals/.}
  spec.description   = %q{It displays popular deals of the day from https://slickdeals.net/deals/.}
  spec.homepage      = "https://github.com/HimaChitalia/popular_deals"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split($\)
  spec.bindir        = "exe"
  spec.executables   = ["popular-deals"]
  spec.require_paths = ["lib" "lib/popular_deals"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
end
