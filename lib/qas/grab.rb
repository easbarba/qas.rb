# frozen_string_literal: true

require 'git'

module Qas
  # Clone or Pull FLOSS Projects
  class Grab
    attr_reader :project

    def initialize(project)
      @project = project
    end

    def pull
      Utils.spin(project.name) do
        repo = Git.open project.folder
        repo.pull 'origin', repo.current_branch
      end
    end

    def clone
      Utils.spin(project.name) do
        Git.clone project.url, project.folder
      end
    end

    # Cloning/Pulling FLOSS Project
    def run
      project.folder.join('.git').exist? ? pull : clone
    end
  end
end
