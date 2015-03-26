require "rubygems"
require "bundler"
Bundler.require :default, (ENV["RACK_ENV"] || "development").to_sym

class Application < Sinatra::Base
  register Sinatra::R18n
  register Sinatra::Partial

  get "/" do
    haml :index
  end
end

Dir[File.dirname(__FILE__) + "/config/*.rb"].each { |file| require file }
