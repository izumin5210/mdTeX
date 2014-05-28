require 'rake/clean'

include Mdtex::load_config

CLEAN.include(FileList["#{TEMP_DIR}/*"])
CLEAN.include(FileList["#{DEST_DIR}/*"])

desc "Preview #{File.join(File.basename(TEMP_DIR), PDF_FILE)} with #{PREVIEW_COMMAND}"
task :preview do
  sh "#{PREVIEW_COMMAND} #{File.join(TEMP_DIR, PDF_FILE)}"
end
