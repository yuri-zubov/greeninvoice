# frozen_string_literal: true

require_relative "lib/greeninvoice/version"

Gem::Specification.new do |spec|
  spec.name          = "greeninvoice"
  spec.version       = Greeninvoice::VERSION
  spec.authors       = ["Yuri Zubov"]
  spec.email         = ["y.zubov@sumatosoft.com"]

  spec.summary       = "Wrapper for greeninvoice API"
  spec.description   = "Wrapper for greeninvoice API"
  spec.homepage      = "https://github.com/yuri-zubov/greeninvoice"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/yuri-zubov/greeninvoice"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, checkout our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.add_development_dependency "bundler", ">= 1.17"
  spec.add_development_dependency "rake", ">= 10.0"
  spec.add_development_dependency "rspec", ">= 3.0"
  spec.add_development_dependency "pry", ">= 0"

  spec.add_runtime_dependency 'activesupport', '>= 4.2'
  spec.add_runtime_dependency 'rest-client', '>= 2'
  # spec.add_runtime_dependency 'nokogiri', '>= 1'
end
