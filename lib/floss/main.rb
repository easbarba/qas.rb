module Floss
  # Core Management FLOSS Projects
  class Main
    class GitMustBeAvailable < StandardError; end

    attr_reader :folders, :utils, :command

    def initialize(services, command)
      @utils = services
      @command = command
    end

    def projects
      @projects ||= Projects.new.parse_folder
    end

    def current_project
      projects.each do |language, repos|
        puts "\n❯ #{language.capitalize}\n"

        repos.each do |project|
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

      raise GitMustBeAvailable, 'Git not Found' unless utils.commandv?('git').any?

      current_project do |project|
        actions[command].call(project).run
      end
    end
  end
end
