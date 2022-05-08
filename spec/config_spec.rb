# frozen_string_literal: true

require 'spec_helper'

require 'floss'

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
        project = config.items.values.sample.first
        expect(project.url).to be_a_kind_of URI
      end
    end
  end
end
