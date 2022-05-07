# frozen_string_literal: true

require 'git'

module Floss
  # Grab FLOSS Projects
  class Grab
    attr_reader :project

    def initialize(project)
      @project = project
    end

    def pull
      Utils.spin('Pulling') do
        repo = Git.open project.folder
        repo.pull 'origin', repo.current_branch
      end
    end

    def clone
      Utils.spin('Cloning') do
        Git.clone project.url, project.folder
      end
    end

    # Cloning/Pulling FLOSS Project
    def run
      puts project.to_s

      project.folder.exist? ? pull : clone

      puts
    end
  end
end
