require 'yaml'
require 'rake'

module Mdtex
  module Constant
    config = YAML.load_file(Mdtex::SETTING_FILE)
    CWD = Dir.pwd

    # config (flag)
    DO_BIBTEX = config['bibtex'].freeze

    # config (command)
    TEX2DVI_COMMAND = config['command']['tex2dvi'].freeze
    DVI2PDF_COMMAND = config['command']['dvi2pdf'].freeze
    BIBTEX_COMMAND = config['command']['bibtex'].freeze
    PREVIEW_COMMAND = config['command']['preview'].freeze

    # config (file, directory)
    SRC_DIR = File.join(CWD, config['src']).freeze
    TEMP_DIR = File.join(CWD, config['temp']).freeze
    DEST_DIR = File.join(CWD, config['dest']).freeze
    ROOT_FILE = config['root_file'].freeze

    # src files
    MD_FILES = FileList["#{SRC_DIR}/**/*.md"]
    SRC_FILES = FileList.new("#{SRC_DIR}/**/*") do |list|
      list.exclude('**/*.md')
      list.exclude { |f| File.directory? f }
    end

    # generated files
    TEX_FILES = MD_FILES.gsub(/^#{SRC_DIR}/, TEMP_DIR).ext('.tex')
    MISC_FILES = SRC_FILES.gsub(/^#{SRC_DIR}/, TEMP_DIR)
    DVI_FILE = ROOT_FILE.ext('.dvi').freeze
    AUX_FILE = ROOT_FILE.ext('.aux').freeze
    PDF_FILE = ROOT_FILE.ext('.pdf').freeze
  end
end
