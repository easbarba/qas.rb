# frozen_string_literal: true

require 'uri'
require 'csv'
require 'pathname'

module Floss
  # Parse all files and compile them as a single object
  class ParseProjects
    PROJECTS_LOCATION = Pathname.new(File.join(Dir.home, '.config', 'floss'))
    PROJECTS_FILES = PROJECTS_LOCATION.children

    def to_project(file, lang)
      [].tap do |x|
        CSV.read(file, headers: true).by_row.each do |project|
          name = project['name']
          url = URI project['repository']

          x << ProjectInfo.new(name, url, lang.to_s)
        end
      end
    end

    # Parse files available
    def parse_folder
      projects = {}

      PROJECTS_FILES.each do |file|
        lang = file.basename.sub_ext('').to_s.to_sym
        projects[lang] = to_project file, lang
      end

      projects
    end
  end
end
