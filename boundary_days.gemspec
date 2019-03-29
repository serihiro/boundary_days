# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'boundary_days/version'

Gem::Specification.new do |spec|
  spec.name          = 'boundary_days'
  spec.version       = BoundaryDays::VERSION
  spec.authors       = ['Kazuhiro Serizawa']
  spec.email         = ['nserihiro@gmail.com']

  spec.summary       = %q{Generate Date object list of sensitive dates.}
  spec.description   = %q{Generate Date object list of sensitive dates.}
  spec.homepage      = 'https://github.com/serihiro/boundary_days'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
