# frozen_string_literal: true

module Floss
  # Core Management FLOSS Projects
  class Main
    class GitMustBeAvailable < StandardError; end

    attr_reader :folders, :utils, :command

    def initialize(services, command)
      @utils = services.resolve :utils
      @command = command
    end

    # get all projects
    def parsed_projects
      ParseProjects.new.parse_folder
    end

    def manage_projects
      parsed_projects.each do |language, projects|
        puts "\n❯ #{language.capitalize}\n"

        projects.each do |project|
          yield project if block_given?
        end
      end
    end

    def actions
      { grab: ->(project) { Grab.new(utils, project) }.curry,
        archive: ->(project) { Archive.new(utils, project) }.curry }
    end

    def run
      return unless actions.keys.include? command

      raise GitMustBeAvailable.new 'Git not Found' unless utils.commandv?('git').any?

      manage_projects do |project|
        actions[command].call(project).run
      end
    end
  end
end
