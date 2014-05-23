require 'thor'

module Mdtex
  class CLI < Thor
    include Thor::Actions

    def self.source_root
      File.expand_path(File.join(File.dirname(__FILE__), 'templates'))
    end

    desc "init", "Create a new TeX project."
    def init(name)
      templates = {
        "gitignore.tt" => ".gitignore",
        "Rakefile.tt" => "Rakefile",
        "config.yml.tt" => "config.yml",
        "src/document.tex.tt" => "src/document.tex"
      }

      templates.each do |src, dist|
        template(src, "#{name}/#{dist}")
      end

      Dir.chdir(name) { `git init; git add .` }
    end
  end
end
