# frozen_string_literal: true

require 'pathname'

module Floss
  # Archive FLOSS Projects
  class Archive
    # Format to be compressed
    attr_reader :format

    # FLOSS Projects elected to be archived
    attr_reader :projects

    attr_reader :project

    # Folder to store compressed projects
    FOLDER = Pathname.new(File.join(Dir.home, 'Downloads', 'archived'))

    def initialize(project, projects, fmt = 'tar')
      @project = project
      @projects = projects
      @format = fmt
      @fullpath = "#{FOLDER.join(project.name)}.#{@format}"
    end

    # Archiving FLOSS project
    def archive
      require 'git'

      Utils.spin('Archiving') do
        repo = Git.open project.folder
        repo.archive repo.current_branch, @fullpath, format: @format # TODO: fiber/multithread
      end

      puts # a bit more of space
    end

    def mkfolder
      Dir.mkdir FOLDER unless FOLDER.exist?
    end

    def info
      puts "#{project.name} > #{@fullpath}"
    end

    def run
      return unless projects.include? project.name

      info
      mkfolder
      archive
    end
  end
end
