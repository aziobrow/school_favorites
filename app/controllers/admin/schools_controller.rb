class Admin::SchoolsController < Admin::BaseController
  def new
    @school = School.new
  end

  def create
    @school = School.new(school_params)
    if @school.save
      flash[:success] = "You created a listing for #{@school.name}"
      redirect_to school_path(@school)
    else
      flash[:error] = "Please enter all fields."
      render :new
    end
  end

  private

  def school_params
    params.require(:school).permit(:school_number, :name, :address, :zip_code, :phone, :principal, :grade_levels, :web_url, :description, :district_id)
  end

end
