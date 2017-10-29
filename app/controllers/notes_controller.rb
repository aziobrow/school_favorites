class NotesController < ApplicationController
  def create
    favorite_school = FavoriteSchool.find(params[:favorite_school_id])
    @note = favorite_school.notes.create(note_params)

    redirect_back(fallback_location: root_path)
  end

  private

  def note_params
    params.require(:note).permit(:content, :favorite_school_id)
  end
end
