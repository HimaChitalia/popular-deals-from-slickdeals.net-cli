# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'popular_deals/version'

Gem::Specification.new do |spec|
  spec.name          = "popular_deals"
  spec.version       = PopularDeals::VERSION
  spec.authors       = ["'Hima Chitalia'"]
  spec.email         = ["'hima_chhag@yahoo.com'"]

  spec.summary       = %q{It displays popular deals of the day from https://slickdeals.net/deals/ with popular-deals command.}
  spec.description   = %q{This CLI App displays a list of the popular deals with deal rating and price. Just use 'popular-deals' command. You can also see a deal details by selecting number of the deal you may be interested in.}
  spec.homepage      = "https://github.com/HimaChitalia/popular_deals"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
     f.match(%r{^(test|spec|features)/})
   end
   spec.bindir        = "bin"
   spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
   spec.require_paths = ["lib"]
   spec.post_install_message = "Cinderella is a proof that a new pair of shoes can change your life."

   spec.add_development_dependency "bundler", "~> 1.14"
   spec.add_development_dependency "rake", "~> 10.0"

  spec.add_dependency "nokogiri"
  spec.add_dependency "colorize", '~> 0'
  spec.add_dependency "pry"


end
