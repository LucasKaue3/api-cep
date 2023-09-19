require 'httparty'
require 'pry'
require 'cucumber'
require 'report_builder'
require_relative 'page_helpers.rb'
require_relative 'link_helpers.rb'

World(PagesObjects)
World(LinkHelpers)

$env = (ENV['AMBIENTE'] || 'dev')
