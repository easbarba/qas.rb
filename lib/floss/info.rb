# frozen_string_literal: true

require 'pathname'

module Floss
  # Project Information
  class Info
    ROOT = Pathname.new(File.join(Dir.home, 'Projects'))

    attr_reader :url, :name, :folder

    def initialize(name, url, language)
      @name = name
      @url = url

      @folder = ROOT.join language, name
    end

    def to_s
      <<~INFO
        #{name}
      INFO
    end
  end
end
