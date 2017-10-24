class DistrictsController < ApplicationController
  def index
    @districts = District.all
  end

  def show
    @district = District.find(params[:district_id])
    redirect_to district_schools_path(@district)
  end
end
