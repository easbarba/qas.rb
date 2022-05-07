# frozen_string_literal: true

require 'pathname'

module Floss
  # Archive FLOSS Projects
  class Archive
    # FLOSS Projects elected to be archived
    ARCHIVE_THESE = %w[lar distro cejo ixe gota].freeze # TODO: as cli argument instead

    # Format to be compressed
    FMT = 'tar'

    # Folder which compressed files will be stored
    ARCHIVED_FOLDER = Pathname.new(File.join(Dir.home, 'Downloads', 'archived'))

    attr_reader :archived_filename, :project

    def initialize(project)
      @project = project
      @archived_filename = "#{ARCHIVED_FOLDER.join(project.name)}.#{FMT}"
    end

    # Archiving FLOSS project
    def do_archive
      require 'git'

      Utils.spin('Archiving') do
        repo = Git.open project.folder
        repo.archive repo.current_branch, archived_filename, format: FMT # TODO: fiber/multithread
      end

      puts # a bit more of space
    end

    def run
      return unless ARCHIVE_THESE.include? project.name

      Dir.mkdir ARCHIVED_FOLDER unless ARCHIVED_FOLDER.exist?

      print project.to_s
      do_archive
    end
  end
end
