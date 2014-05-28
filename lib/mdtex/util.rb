require 'pathname'

module Mdtex
  SETTING_FILE = './config.yml'
  class << self
    def load_config
      raise 'config.yml is not found.' unless File.exists? SETTING_FILE
      require 'mdtex/constant'
      Mdtex::Constant
    end

    def make_target_directory(target)
      target_dir = File.dirname(target)
      FileUtils.mkdir_p target_dir unless File.directory?(target_dir)
    end

    def md2latex(src, dest)
      if exist_command?('pandoc')
        `pandoc #{src} -o #{dest} > /dev/null`
      else
        raise 'pandoc is not installed.'
      end
    end

    def exist_command?(command)
      `type "#{command}" 2> /dev/null` != ''
    end

    def relative_path(path, base=Dir.pwd)
      Pathname(path).relative_path_from(Pathname(base))
    end
  end
end
