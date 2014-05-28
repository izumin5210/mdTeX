# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mdtex/version'

Gem::Specification.new do |spec|
  spec.name          = "mdtex"
  spec.version       = Mdtex::VERSION
  spec.authors       = ["izumin5210"]
  spec.email         = ["masayuki@izumin.info"]
  spec.summary       = %q{Make LaTeX document with Markdown}
  spec.description   = %q{This gem provides some functions making LaTeX document with Markdown.}
  spec.homepage      = "http://izumin.info/"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_runtime_dependency "thor"
  spec.add_runtime_dependency "capture_std"
end
