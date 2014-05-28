require "bundler/gem_tasks"

task :debug_install do
  gem = $1 if `bundle exec rake build` =~ /(pkg\/mdtex-[\d\.]+\.gem)\.$/
  sh "gem install -l #{gem}"
  sh "rbenv rehash"
end
