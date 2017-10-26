class FavoriteSchoolsController < ApplicationController
  before_action :set_school

  def create
    @favorite_school = FavoriteSchool.new(user: current_user, school: @school)
    if @favorite_school.save
      flash[:success] = "#{@favorite_school.school.name} added to favorites"
      redirect_to school_path(@school)
    else
      flash[:error] = "Oops, something went wrong. Try again."
      redirect_to school_path(@school)
    end
  end

  def destroy
    @favorite_school = FavoriteSchool.find_by(school: @school).destroy
    flash[:success] = "#{@favorite_school.school.name} removed from favorites"
    redirect_to school_path(@school)
  end

  private

  def set_school
    @school = School.find(params[:school_id])
  end

end
