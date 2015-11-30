# Monkey patch to allow certificate failures
module Monittr
  class Server
    def self.fetch(url)
      Timeout::timeout(1) do
        monit_url  = url
        monit_url += '/' unless url =~ /\/$/
        monit_url += '_status?format=xml' unless url =~ /_status\?format=xml$/
        self.new url, RestClient::Request.execute(method: :get, url: monit_url, verify_ssl: false)
      end
    rescue Exception => e
      self.new url, %Q|<error status="3" name="#{e.class}" message="#{e.message}" />|
    end
  end
end
