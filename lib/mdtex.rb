require 'mdtex/version'
require 'mdtex/util'
require 'capture_std'

module Mdtex
end

Dir[File.join(File.dirname(__FILE__), 'mdtex/tasks', '**/*.rake')].each { |rake| load rake }
