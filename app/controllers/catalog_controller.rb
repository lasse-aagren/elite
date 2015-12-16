##
# Simplified catalog controller
class CatalogController < ApplicationController
  include Blacklight::Catalog
  include SpotlightConfig
  include Dtu::CatalogBehavior

  configure_blacklight do |config|

    config.default_solr_params.merge!(qt: 'ddf_publ')
    ## Default parameters to send to solr for all search-like requests. See also SolrHelper#solr_search_params
    config.solr_path = 'ddf_publ'
    config.document_solr_path = 'ddf_publ'
    config.document_unique_id_param = SolrDocument.unique_key

    # solr field configuration for search results/index views
    config.index.title_field = 'title_ts'

    config.add_search_field 'all_fields', label: 'Everything'

    config.add_sort_field 'relevance', sort: 'score desc', label: 'Relevance'

    config.add_field_configuration_to_solr_request!
  end
end
