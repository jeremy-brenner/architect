$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "architect/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "architect"
  s.version     = Architect::VERSION
  s.authors     = ["Jeremy Brenner"]
  s.email       = ["jeremyjbrenner@gmail.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Architect."
  s.description = "TODO: Description of Architect."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.0"

  s.add_development_dependency "sqlite3"
end
