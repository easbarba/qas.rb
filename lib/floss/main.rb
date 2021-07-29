# frozen_string_literal: true

module Floss
  # Core Management FLOSS Projects
  class Main
    attr_reader :folders, :utils, :command

    def initialize(services, command)
      @utils = services.resolve :utils
      @command = command
    end

    # get all projects
    def parsed_projects
      ParseProjects.new.parse_folder
    end

    # organize project information
    def process_projects
      parsed_projects.each do |language, projects|
        puts "\n❯ #{language.capitalize}"
        puts

        projects.each do |project|
          name = project[0].to_s
          url = project[1]
          project_info = ProjectInfo.new name, url, language.to_s

          yield project_info
        end
      end
    end

    # TODO: isso aqui embaixo ta uma porra

    def archive
      process_projects do |info|
        Archive.new(utils, info).run
      end
    end

    public :archive

    def grab
      process_projects do |info|
        Grab.new(utils, info).run
      end
    end

    public :grab

    def run
      public_send(command)
    end

    public :run
  end
end
