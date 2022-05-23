# frozen_string_literal: true

module Qas
  # Main start point
  class Main
    class GitMustBeAvailable < StandardError; end

    attr_reader :folders, :utils, :command, :projects

    def initialize(command, names = nil)
      @command = command
      @names = names
    end

    def projects
      c = Config.new
      c.items
    end

    def current_project
      projects.each do |_, repos|
        repos.each do |project|
          yield project if block_given?
        end
      end
    end

    def actions
      {
        grab: ->(project) { Grab.new(project) }.curry,
        archive: ->(project) { Archive.new(project, @names) }.curry
      }
    end

    def run
      raise GitMustBeAvailable, 'Git was not found!' unless Utils.which?('git').any?

      current_project do |project|
        actions[command].call(project).run
      end
    end
  end
end
