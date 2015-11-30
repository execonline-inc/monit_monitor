A small application based on monitrr to procude one centralized dashboard of all monit processes

![Alt text](https://monosnap.com/file/qRJ1RdJ7aw3RX2BTdJt7hl6ijA0Fh4.png)

# Install

## Rails

### Add to Gemfile

```
gem monit_monitor
```

### Instal gems

```

bundle install

```

###Configure monit dashboard URLS

Create a new initializer file eg `config/initializers/monit.rb`

```
MonitMonitor.configure do |c|
  c.cluster_urls =
    [
      'http://user:pass@dashboard1.monit.one:2812' ,
      'http://user:pass@dashboard1.monit.two:2812'
  ]
end
```

### Add a route

In config/routes.rb

```
mount MonitMonitor::Server.new => "/monit"
```
