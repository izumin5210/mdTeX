include Mdtex::load_config

verbose false

desc "Build #{PDF_FILE} into #{File.basename(DEST_DIR)}"
task build: File.join(DEST_DIR, PDF_FILE)

directory TEMP_DIR
directory DEST_DIR

# Copy SRC_DIR/* (exclude *.md) to TEMP_DIR
rule %r{^#{TEMP_DIR}/(?!.+\.md$)} => "%{^#{TEMP_DIR},#{SRC_DIR}}p" do |task|
  Mdtex::make_target_directory(task.name)
  puts "copy #{Mdtex.relative_path(task.source)} => #{Mdtex.relative_path(task.name)}"
  cp_r task.source, task.name
end

# Convert SRC_DIR/*.md to TEMP_DIR/*.tex"
rule %r{#{TEMP_DIR}/.+\.tex} => "%{^#{TEMP_DIR},#{SRC_DIR}}X.md" do |task|
  Mdtex::make_target_directory(task.name)
  puts "convert #{Mdtex.relative_path(task.source)} => #{Mdtex.relative_path(task.name)}"
  Mdtex::md2latex(task.source, task.name)
end

# Build DVI_FILE from ROOT_FILE into TEMP_DIR
file File.join(TEMP_DIR, DVI_FILE) => [TEMP_DIR, TEX_FILES, MISC_FILES].flatten do |task|
  puts "build #{File.basename(task.name)}"
  cd TEMP_DIR do
    sh "#{TEX2DVI_COMMAND} #{ROOT_FILE} > /dev/null"
    if DO_BIBTEX
      sh "#{BIBTEX_COMMAND} #{AUX_FILE} > /dev/null"
      sh "#{TEX2DVI_COMMAND} #{ROOT_FILE} > /dev/null"
    end
  end
end

# Build PDF_FILE from DVI_FILE into TEMP_DIR
file File.join(TEMP_DIR, PDF_FILE) => File.join(TEMP_DIR, DVI_FILE) do |task|
  puts "build #{File.basename(task.name)}"
  cd TEMP_DIR do
    stderr = capture(:stderr) { sh "#{DVI2PDF_COMMAND} #{DVI_FILE}" }
    # get file size and number of pages from stderr of dvipdfmx
    if stderr.split("\n")[1] =~ /\[(\d+)\]$/
      puts "#{$1} page#{$1.to_i > 1 ? 's' : ''}, #{stderr.split("\n")[2]}"
    end
  end
end

# Copy PDF_FILE to DEST_DIR
file File.join(DEST_DIR, PDF_FILE) => [File.join(TEMP_DIR, PDF_FILE), DEST_DIR] do |task|
  cp task.prerequisites[0], DEST_DIR
end
