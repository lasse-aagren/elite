class ExhibitFilter < ActiveRecord::Migration
  def change
    create_table :exhibit_filters do |t|
      t.references :exhibit
      t.string :field
      t.string :value
    end
  end
end
