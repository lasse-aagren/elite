require 'rails_helper'
describe Spotlight::ExhibitsController do
  routes { Spotlight::Engine.routes }
  describe 'create' do
    let(:user) { FactoryGirl.create(:site_admin) }
    before do
      sign_in user
      # stub out thumbnail job
      allow(Spotlight::DefaultThumbnailJob).to receive(:perform_later)
    end
    it 'is successful' do
      expect do
        post :create, { exhibit: { title: 'Some title', slug: 'custom-slug' },
        exhibit_filter: { field: 'somefield', value: 'someval' } }
      end.to change { Spotlight::Exhibit.count }.by(1)
     .and change { ExhibitFilter.count }.by(1)
    end
  end
end
