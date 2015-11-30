module MonitMonitor
  class Configuration
    attr_writer :cluster_urls

    def cluster_urls
      @cluster_urls.nil? ?  [] : @cluster_urls
    end
  end
end
