# frozen_string_literal: true

module Floss
  # Main start point
  class Main
    class GitMustBeAvailable < StandardError; end

    attr_reader :folders, :utils, :command, :projects, :verbose

    def initialize(command, names = nil, verbose = nil)
      @command = command
      @names = names
      @verbose = verbose
    end

    def projects
      c = Config.new
      c.info if @verbose

      c.items
    end

    def current_project
      projects.each do |item, repos|
        puts
        print "❯ #{item.capitalize}"
        puts

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

    def info
      if command == :info
        puts <<~INFO
          #{VERSION}
        INFO

      end
    end

    def run
      # info and return

      return unless actions.keys.include? command

      raise GitMustBeAvailable, 'Git was not found!' unless Utils.which?('git').any?

      current_project do |project|
        actions[command].call(project).run
      end
    end
  end
end
