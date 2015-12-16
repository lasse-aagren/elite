# Override Spotlight configuration here. See potential config options in spotlight/lib/spotlight/engine.rb

# A lambda expression that filters the solr index per exhibit
Spotlight::Engine.config.exhibit_filter = lambda do |exhibit|
   filter = ExhibitFilter.find_by(exhibit_id: exhibit.id)
   { filter.field => RSolr.solr_escape(filter.value) }
end
