# frozen_string_literal: true

require 'uri'
require 'csv'
require 'pathname'

module Floss
  # Parse all files and compile them as a single object
  class ParseProjects
    PROJECTS_LOCATION = Pathname.new(File.join(Dir.home, '.config', 'floss'))
    PROJECTS_FILES = PROJECTS_LOCATION.children

    def parse_file(file)
      x = {}

      CSV.read(file, headers: true).by_row.each do |name|
        n = name['name'].to_sym
        x[n] = URI(name['repository'])
      end

      x
    end

    # Parse Folder with serialization files
    def parse_folder
      projects = {}

      PROJECTS_FILES.each do |file|
        name = file.basename.sub_ext('').to_s.to_sym
        projects[name] = parse_file file
      end

      projects
    end
  end
end
