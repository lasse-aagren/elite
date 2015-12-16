class ExhibitFilter < ActiveRecord::Base
  validates :field, :value, :exhibit_id, presence: true
end
