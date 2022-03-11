Gem::Specification.new do |spec|
  spec.name = 'floss'
  spec.version = '0.2.0'
  spec.authors = ['easbarba']
  spec.email = ['easbarba@outlook.com']

  spec.summary = 'manage floss projects easily.'
  spec.homepage = 'https://github.com/easbarba/floss'
  spec.required_ruby_version = Gem::Requirement.new('>= 3.0')

  spec.metadata['homepage_uri'] = spec.homepage

  spec.files = Dir.glob('{lib,exe}/**/*', File::FNM_DOTMATCH).reject { |f| File.directory?(f) }
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # runtime
  spec.add_runtime_dependency 'git', '~> 1.8', '>= 1.8.1'
  spec.add_runtime_dependency 'gli', '~> 2.20'
  spec.add_runtime_dependency 'tty-spinner', '~> 0.9.3'
  spec.add_runtime_dependency 'yaml', '~> 0.1.1'

  # development
  spec.add_development_dependency 'rake', '~> 13.0', '>= 13.0.3'
  spec.add_development_dependency 'rspec', '~> 3.10'
end
