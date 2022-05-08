# frozen_string_literal: true

require 'pathname'

module Floss
  # Project Information
  class Info
    ROOT = Pathname.new(File.join(Dir.home, 'Projects'))

    # project name
    attr_reader :name

    # project git branch
    attr_reader :branch

    # project uri
    attr_reader :uri

    # project folder
    attr_reader :folder

    def initialize(name, branch, url, language)
      @name = name
      @branch = branch
      @url = url
      @folder = ROOT.join(language, name)
    end

    def to_s
      <<~INFO
        #{name}
      INFO
    end
  end
end
