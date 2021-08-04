# frozen_string_literal: true

require 'uri'
require 'csv'
require 'pathname'

# TODO: Delay parsing file till just finally needed

module Floss
  # Gather all Projects available
  class Projects
    PROJECTS_LOCATION = Pathname.new(File.join(Dir.home, '.config', 'floss'))
    PROJECTS_FILES = PROJECTS_LOCATION.children

    def all_projects(file, lang)
      [].tap do |x|
        CSV.read(file, headers: true).by_row.each do |project|
          name = project['name']
          url = URI project['repository']

          x << ProjectInfo.new(name, url, lang.to_s)
        end
      end
    end

    def files_found
      puts 'Files found:'
      PROJECTS_FILES.each do |file|
        puts file
      end
    end

    # Parse files available
    def parse_folder
      files_found

      projects = {}

      PROJECTS_FILES.each do |file|
        lang = file.basename.sub_ext('').to_s.to_sym
        projects[lang] = all_projects file, lang
      end

      projects
    end
  end
end
