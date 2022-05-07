# frozen_string_literal: true

require 'spec_helper'
require_relative '../lib/floss'

module Floss
  RSpec.describe Config do
    subject(:config) { Config.new }

    context '#found' do
      it 'has, at least, one config file correctly parsed' do
        expect(config.found).not_to be_nil
      end

      # it 'no config file was found' do
      #   expect(config.found).not_to be_nil
      # end
    end

    context '#projects' do
      it "random project's URI attribute is a properly formatted" do
        project = config.projects.values.sample.first
        expect(project.url.class).to be URI::HTTPS
      end
    end
  end
end
