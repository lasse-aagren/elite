require 'rails_helper'

describe ExhibitFilter do
  describe 'validations' do
    let(:valid_fields) { { exhibit_id: 1, field: 'something', value: 'something else' } }
    subject { described_class.new(fields) }
    context 'when field is not set' do
      let(:fields) { valid_fields.except :field }
      it { is_expected.not_to be_valid }
    end
    context 'when value is not set' do
      let(:fields) { valid_fields.except :value }
      it { is_expected.not_to be_valid }
    end
    context 'when exhibit is not set' do
      let(:fields) { valid_fields.except :exhibit_id }
      it { is_expected.not_to be_valid }
    end
    context 'when all fields are set' do
      let(:fields) { valid_fields }
      it { is_expected.to be_valid }
    end
  end
end
