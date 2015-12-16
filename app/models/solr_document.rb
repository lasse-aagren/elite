# -*- encoding : utf-8 -*-
class SolrDocument

  include Blacklight::Solr::Document
  include Blacklight::Gallery::OpenseadragonSolrDocument

  include Spotlight::SolrDocument

  include Spotlight::SolrDocument::AtomicUpdates

  self.unique_key = 'cluster_id_ss'

  # Since our unique key is multi-valued but Spotlight/blacklight
  # sometimes assume a single value we need to override the lookup
  # method to cast to single value when it is being referenced
  def [](key)
    if key.to_s == self.class.unique_key
      return Array(super).first
    end
    super
  end


  # Email uses the semantic field mappings below to generate the body of an email.
  SolrDocument.use_extension( Blacklight::Document::Email )

  # SMS uses the semantic field mappings below to generate the body of an SMS email.
  SolrDocument.use_extension( Blacklight::Document::Sms )

  # DublinCore uses the semantic field mappings below to assemble an OAI-compliant Dublin Core document
  # Semantic mappings of solr stored fields. Fields may be multi or
  # single valued. See Blacklight::Document::SemanticFields#field_semantics
  # and Blacklight::Document::SemanticFields#to_semantic_values
  # Recommendation: Use field names from Dublin Core
  use_extension( Blacklight::Document::DublinCore)

  # Spotlight overrides to prevents errors
  def self.solr_field_for_tagger(exhibit)
    :fake_ss
  end

  def self.visibility_field(exhibit)
    :fake_ss
  end


end
