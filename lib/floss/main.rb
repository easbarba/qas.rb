# frozen_string_literal: true

require 'pathname'

module Floss
  # Core Management FLOSS Projects
  class Main
    attr_reader :folders, :utils, :command

    def initialize(services, command)
      @folders = services.resolve :folders
      @utils = services.resolve :utils
      @command = command
    end

    # a
    def parsed_projects
      folder = folders.floss_config
      utils.parse_folder folder
    end

    # a
    def process_projects
      parsed_projects.each do |language, projects|
        puts "\n❯ #{language.capitalize}"
        puts

        projects.each do |url|
          project_info = ProjectInfo.new url, language.to_s
          yield project_info
        end
      end
    end

    def archive
      process_projects do |info|
        Archive.new(utils, info.name, info.folder, info.to_s).run
      end
    end
    public :archive

    def grab
      process_projects do |info|
        Grab.new(utils, info.folder, info.url, info.to_s).run
      end
    end
    public :grab

    def run
      public_send(command)
    end
    public :run
  end
end
