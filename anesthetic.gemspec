# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "anesthetic/version"

Gem::Specification.new do |s|
  s.name        = "anesthetic"
  s.version     = Anesthetic::VERSION
  s.authors     = ["Mikhail Kuryshev"]
  s.email       = ["tensai@cirno.in"]
  s.homepage    = ""
  s.summary     = %q{Easier debugging}
  s.description = %q{Dumps local variables along with backtrace.}

  s.rubyforge_project = "anesthetic"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
