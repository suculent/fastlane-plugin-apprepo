require 'coveralls'
Coveralls.wear! # unless ENV["FASTLANE_SKIP_UPDATE_CHECK"]

# require 'webmock/rspec'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

# This module is only used to check the environment is currently a testing env
module SpecHelper
end

require 'fastlane' # to import the Action super class
require 'fastlane/plugin/apprepo' # import the actual plugin

# WebMock.disable_net_connect!(allow: 'coveralls.io')
