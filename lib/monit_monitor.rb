$LOAD_PATH.unshift( File.expand_path('../../lib', __FILE__) )

require 'rubygems'
require 'monittr'
require 'sinatra'

require 'monittr_override'
require 'helpers.rb'
require 'configuration'

module MonitMonitor
  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= MonitMonitor::Configuration.new
  end

  def self.reset
    @configuration = MonitMonitor::Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  class Server < Sinatra::Base
    helpers Sinatra::MonittrHTML::Helpers

    set :cluster,  -> {
      Monittr::Cluster.new(MonitMonitor.configuration.cluster_urls)
    }

    get "/" do
      erb :index
    end

  end
end
