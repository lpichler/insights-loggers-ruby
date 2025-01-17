
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "insights/loggers/version"
require "rbconfig"

Gem::Specification.new do |spec|
  spec.name          = "insights-loggers-ruby"
  spec.version       = Insights::Loggers::VERSION
  spec.authors       = ["Insights Authors"]

  spec.summary       = %q{Loggers for Insights ruby projects}
  spec.homepage      = "https://github.com/ManageIQ/manageiq-loggers"
  spec.licenses      = ["Apache-2.0"]

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "activesupport", "~> 5.2", ">= 5.2.4.3"

  spec.add_runtime_dependency "manageiq-loggers", "~> 0.4", ">= 0.4.2"

  spec.add_runtime_dependency "cloudwatchlogger", "~> 0.2.1"

  spec.add_development_dependency "topological_inventory-providers-common", "~> 3.0.1"
  spec.add_development_dependency "manageiq-style", "~> 1.3.0"
  spec.add_development_dependency "rake", "~> 12.3", ">= 12.3.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "simplecov", "~> 0.21.2"
  spec.add_development_dependency "timecop", "~> 0.9.4"
  spec.add_development_dependency "systemd-journal" if RbConfig::CONFIG['host_os'] =~ /linux/i
end
