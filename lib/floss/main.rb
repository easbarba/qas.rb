# frozen_string_literal: true

module Floss
  # Core Management FLOSS Projects
  class Main
    attr_reader :folders, :utils, :command

    def initialize(services, command)
      @utils = services.resolve :utils
      @command = command
    end

    def actions
      { grab: ->(project) { Grab.new(utils, project) }.curry,
        archive: ->(project) { archive.new(utils, project) }.curry }
    end

    # get all projects
    def parsed_projects
      ParseProjects.new.parse_folder
    end

    def manage_projects
      parsed_projects.each do |language, projects|
        puts "\n❯ #{language.capitalize}\n"

        projects.each do |project|
          yield project
        end
      end
    end

    def run
      return unless actions.keys.include? command

      manage_projects do |project|
        actions[command].call(project).run
      end
    end
  end
end
