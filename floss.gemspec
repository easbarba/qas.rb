# frozen_string_literal: true

require_relative "lib/floss/version"

Gem::Specification.new do |spec|
  spec.name          = "floss"
  spec.version       = Floss::VERSION
  spec.authors       = ["easbarbosa"]
  spec.email         = ["easbarbosa@tutanota.me"]

  spec.summary       = 'Install local builds of FLOSS Projects.'
  # spec.description   = "TODO: Write a longer description or delete this line."
  spec.homepage      = 'https://git.sr.ht/~easbarbosa/floss'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7')

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'https://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # requirements
  # spec.requirements << 'ffmpeg'
  # spec.requirements << 'libyaml'
   # spec.requirements << 'mpv'

  # runtime
  spec.add_runtime_dependency 'dry-auto_inject', '~> 0.7.0'
  spec.add_runtime_dependency 'dry-container', '~> 0.7.2'
  spec.add_runtime_dependency 'git', '~> 1.8', '>= 1.8.1'
  spec.add_runtime_dependency 'gli', '~> 2.20'
  spec.add_runtime_dependency 'tty-spinner', '~> 0.9.3'
  spec.add_runtime_dependency 'yaml', '~> 0.1.1'

  # development
  spec.add_development_dependency 'bundler', '~> 2.2', '>= 2.2.17'
  spec.add_development_dependency 'minitest', '~> 5.14', '>= 5.14.4'
  spec.add_development_dependency 'pry', '~> 0.14.1'
  spec.add_development_dependency 'rake', '~> 13.0', '>= 13.0.3'
  spec.add_development_dependency 'rdoc', '~> 6.3', '>= 6.3.1'
  spec.add_development_dependency 'reek', '~> 6.0', '>= 6.0.4'
  spec.add_development_dependency 'rspec', '~> 3.10'
  spec.add_development_dependency 'rubocop', '~> 1.15'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.3'
  spec.add_development_dependency 'rufo', '~> 0.12.0'
  spec.add_development_dependency 'yard', '~> 0.9.26'
  spec.add_development_dependency 'solargraph', '~> 0.40.4'
end
