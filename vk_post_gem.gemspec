# -*- encoding: utf-8 -*-
require File.expand_path('../lib/vk_post_gem/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["kasabian"]
  gem.email         = ["pandascrp@mail.ru"]
  gem.description   = %q{gem for vk_post}
  gem.summary       = %q{get id user and post vol}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "vk_post_gem"
  gem.require_paths = ["lib"]
  gem.version       = VkPostGem::VERSION
  

  gem.add_dependency "hpricot"
  gem.add_dependency "mechanize"
  gem.add_dependency "sqlite3"
  gem.add_development_dependency "rspec"
  

end
