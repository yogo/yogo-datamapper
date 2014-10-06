Gem::Specification.new do |gem|
  gem.authors       = [ "Ryan Heimbuch" ]
  gem.email         = [ "yogo@msu.montana.edu" ]
  gem.description   = "Yogo Extensions to DataMapper."
  gem.summary       = "Yogo Extensions to DataMapper."
  gem.homepage      = "http://yogo.msu.montana.edu"
  gem.date          = "2011-12-20"

  gem.files         = `git ls-files`.split("\n")
  gem.extra_rdoc_files = %w[LICENSE README.rdoc]

  gem.name          = "yogo-datamapper"
  gem.require_paths = [ "lib" ]
  
  gem.version       = "0.5.1"

  gem.add_runtime_dependency("yogo-operation")
  gem.add_runtime_dependency("yogo-support")
  gem.add_runtime_dependency("datamapper", "1.2.0")
  gem.add_runtime_dependency("dm-is-remixable")
end


