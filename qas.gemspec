# frozen_string_literal: true

require_relative 'lib/info'

Gem::Specification.new do |spec|
  spec.name = 'qas'
  spec.version = Qas::VERSION
  spec.authors = ['easbarba']
  spec.email = ['easbarba@outlook.com']
  spec.summary = Qas::DESCRIPTION
  spec.homepage = Qas::URL
  spec.license = 'gpl-v3'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7')
  spec.metadata['homepage_uri'] = spec.homepage
  spec.files = Dir.glob('{lib,exe}/**/*', File::FNM_DOTMATCH).reject { |f| File.directory?(f) }
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # runtime
  spec.add_runtime_dependency 'git', '~> 1.12'
  spec.add_runtime_dependency 'tty-spinner', '~> 0.9.3'

  # development
  spec.add_development_dependency 'rake', '~> 13.0', '>= 13.0.6'
  spec.add_development_dependency 'reek', '~> 6.1', '>= 6.1.1'
  spec.add_development_dependency 'rspec', '~> 3.11'
  spec.add_development_dependency 'rufo', '~> 0.13.0'
end
