# frozen_string_literal: true

require 'csv'
require 'pathname'
require 'uri'

# TODO: Delay parsing file till just finally needed
# TODO: Check if file match expect structure
# TODO: check if file is empty

module Qas
  # List all config available
  class Projects
    def parse(file, lang)
      [].tap do |x|
        CSV.read(file, headers: true).by_row.each do |project|
          name = project['name']
          branch = project['branch']
          url = URI project['url']

          x << Info.new(name, branch, url, lang.to_s)
        end
      end
    end

    def found
      files = Pathname.new(File.join(Dir.home, '.config', 'qas'))

      [].tap do |x|
        # Check if config does not exist if a symlink
        files.children.each do |y|
          x << y if y.exist?
        end
      end
    end

    # returns all parsed items
    def items
      {}.tap do |x|
        found.each do |file|
          lang = file.basename.sub_ext('').to_s.to_sym
          x[lang] = parse file, lang
        end
      end
    end
  end
end
