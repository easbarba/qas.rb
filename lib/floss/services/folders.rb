# frozen_string_literal: true

require 'pathname'

module Floss
  module Services
    # System Folders
    class Folders
      attr_reader :floss_config, :downloads, :pictures, :local

      HOME = Dir.home
      XDG_CONFIG_HOME = Pathname.new(File.join(HOME, '.config'))

      def initialize
        @floss_config = Pathname.new(File.join(XDG_CONFIG_HOME, 'floss'))
        @downloads = Pathname.new(File.join(HOME, 'Downloads'))
        @pictures = Pathname.new(File.join(HOME, 'Pictures'))
        @local = Pathname.new(File.join(HOME, '.local'))
      end
    end
  end
end
