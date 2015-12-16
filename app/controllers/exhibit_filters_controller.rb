class ExhibitFiltersController < ApplicationController
  load_and_authorize_resource

  def update
    unless @exhibit_filter.update(exhibit_filter_params)
      flash[:alert] = @exhibit_filter.errors.full_messages.join('<br/>'.html_safe)
    end
    redirect_to spotlight.edit_exhibit_path @exhibit_filter.exhibit_id, anchor: 'filter'
  end

  def exhibit_filter_params
    params.require(:exhibit_filter).permit(:field, :value)
  end
end
