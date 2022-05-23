# frozen_string_literal: true

module Qas
  # General Utilities.
  module Utils
    # Spin for me, dear.
    def self.spin(project)
      require 'tty-spinner'

      spinner = TTY::Spinner.new("#{project} :spinner ", format: :dots_6)
      spinner.auto_spin

      yield

      spinner.success
    end

    # prints external executable location
    def self.which?(executable)
      require 'pathname'

      [].tap do |x|
        ENV['PATH'].split(File::PATH_SEPARATOR) do |directory|
          exec = Pathname.new(directory).join executable.to_s

          x << exec.to_path if exec.file?
        end
      end.uniq
    end
  end
end
