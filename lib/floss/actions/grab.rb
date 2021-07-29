# frozen_string_literal: true

require 'git'

module Floss
  # Grab FLOSS Projects
  class Grab
    attr_reader :utils, :project

    def initialize(utils, project)
      @utils = utils
      @project = project
    end

    def do_pull
      utils.spin('Pulling') do
        repo = Git.open project.folder
        repo.pull 'origin', repo.current_branch
      end
    end

    def do_clone
      utils.spin('Cloning') do
        Git.clone project.url, project.folder
      end
    end

    # Cloning/Pulling FLOSS Project
    def run
      puts project.to_s

      if folder.exist?
        do_pull
      else
        do_clone
      end
      puts
    end
  end
end
