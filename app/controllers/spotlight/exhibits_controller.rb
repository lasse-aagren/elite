module Spotlight
  class ExhibitsController < ApplicationController
    include Spotlight::ExhibitsControllerBehavior

    def create
      @exhibit.attributes = exhibit_params
      if @exhibit.save
        ExhibitFilter.create!(exhibit_id: @exhibit.id, field: params['exhibit_filter']['field'], value: params['exhibit_filter']['value'])
        @exhibit.roles.create user: current_user, role: 'admin' if current_user
        redirect_to spotlight.exhibit_dashboard_path(@exhibit), notice: t(:'helpers.submit.exhibit.created', model: @exhibit.class.model_name.human.downcase)
      else
        render action: :new
      end
    end
  end
end
