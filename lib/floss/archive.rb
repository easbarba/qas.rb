# frozen_string_literal: true

require 'pathname'

# TODO: if project is not present, clone it!

module Floss
  # Archive FLOSS Projects
  class Archive
    # Format to be compressed
    attr_reader :format

    # FLOSS Projects elected to be archived
    attr_reader :names

    # project
    attr_reader :project

    # Folder to store compressed projects
    ARCHIVED = Pathname.new(File.join(Dir.home, 'Downloads', 'archived'))

    def initialize(project, names, fmt = 'tar')
      @project = project
      @names = names
      @format = fmt
      @fullpath = "#{ARCHIVED.join(project.name)}.#{@format}"
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

    # create archived folder
    def mkfolder
      require 'fileutils'
      FileUtils.mkdir_p ARCHIVED unless ARCHIVED.exist?
    end

    def info
      print "#{project.name} > #{@fullpath}"
    end

    def run
      return unless names.include? project.name

      mkfolder
      info
      archive
    end
  end
end
