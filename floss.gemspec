# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name = 'floss'
  spec.version = '1.3.1'
  spec.authors = ['easbarba']
  spec.email = ['easbarba@outlook.com']

  spec.summary = 'easily manage floss repositories.'
  spec.homepage = 'https://github.com/easbarba/floss'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.7')
  spec.metadata['homepage_uri'] = spec.homepage

  spec.files = Dir.glob('{lib,exe}/**/*', File::FNM_DOTMATCH).reject { |f| File.directory?(f) }
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # runtime
  spec.add_runtime_dependency 'git', '~> 1.11'
  spec.add_runtime_dependency 'tty-spinner', '~> 0.9.3'

  # development
  spec.add_development_dependency 'rake', '~> 13.0', '>= 13.0.6'
  spec.add_development_dependency 'reek', '~> 6.1', '>= 6.1.1'
  spec.add_development_dependency 'rspec', '~> 3.11'
  spec.add_development_dependency 'rubocop', '~> 1.29'
  spec.add_development_dependency 'rufo', '~> 0.13.0'
end
