# frozen_string_literal: true

module Floss
  module Services
    # General Utilities.
    class Utils
      # a
      def spin(msg)
        warning = 'status:'

        require 'tty-spinner'
        spinner = TTY::Spinner.new("#{warning} #{msg.downcase} :spinner ", format: :dots_6)
        spinner.auto_spin

        yield
        spinner.success
      end
    end
  end
end
