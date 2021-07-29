# frozen_string_literal: true

require 'pathname'

module Floss
  # Provides Project Information
  class ProjectInfo
    attr_reader :url, :name, :folder

    def initialize(name, url, language)
      @name = name
      @url = url

      root = Pathname.new(File.join(Dir.home, 'Projects'))
      @folder = root.join language, name
    end

    def to_s
      <<~INFO
        name: #{name}
        repository: #{url}
        folder: #{folder}
      INFO
    end
  end
end
