# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module Jpsys
  class Application < Rails::Application
    config.load_defaults 6.0

    config.generators do |g|
      g.test_framework :rspec,
                       fixtures: false,
                       view_specs: false,
                       helper_specs: false,
                       routing_specs: false
    end

    config.paths.add 'lib', eager_load: true
  end
end
