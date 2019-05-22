class Admin::SongsController < Admin::BaseController
  def destroy
    song = Song.find(params[:id])
    song.destroy
  end
end
