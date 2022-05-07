# frozen_string_literal: true

module Floss
  # General Utilities.
  class Utils
    # ...
    def spin(msg)
      warning = 'status:'

      require 'tty-spinner'
      spinner = TTY::Spinner.new("#{warning} #{msg.downcase} :spinner ", format: :dots_6)
      spinner.auto_spin

      yield
      spinner.success
    end

    # return all executable found
    def commandv?(executable)
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
