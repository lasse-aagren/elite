module SpotlightConfig
  extend ActiveSupport::Concern
  included do
    configure_blacklight do |config|
      config.show.oembed_field = :oembed_url_ssm
      config.show.partials.insert(1, :oembed)
      config.view.gallery.partials = [:index_header, :index]
      config.view.masonry.partials = [:index]
      config.view.slideshow.partials = [:index]
      config.index.timestamp_field = :pub_date_tsort
    end
  end
end
