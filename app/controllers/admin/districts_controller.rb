class Admin::DistrictsController < Admin::BaseController
  def edit
    @district = District.find(params[:id])
  end

  def update
    @district = District.update(params[:id], district_params)
    redirect_to district_path(@district)
  end

  private

  def district_params
    params.require(:district).permit(:name, :board_member)
  end
end
