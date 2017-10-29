class SchoolsController < ApplicationController
  def index
    @schools = School.all
  end

  def show
    if FavoriteSchool.find_by(school_id: params[:id])
      @favorite_school = FavoriteSchool.find_by(school_id: params[:id])
      @school = School.find(params[:id])
      @note = Note.new
    else
      @school = School.find(params[:id])
    end
  end
end
