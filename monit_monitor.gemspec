$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "monit_monitor/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "monit_monitor"
  s.version     = MonitMonitor::VERSION
  s.authors     = ["Ilya Katz"]
  s.email       = ["ilyakatz@gmail.com"]
  s.homepage    = "https://github.com/execonline-inc/"
  s.summary     = "Dashboard for monitoring monit."
  s.description = "Dashboard for monitoring monit."
  s.license     = "MIT"

  s.files = Dir["{lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "sinatra"
  s.add_dependency "monittr"
end
