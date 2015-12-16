# Override Spotlight configuration here. See potential config options in spotlight/lib/spotlight/engine.rb

# A lambda expression that filters the solr index per exhibit
Spotlight::Engine.config.exhibit_filter = lambda do |exhibit|
  { }
end
