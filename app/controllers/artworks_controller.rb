class ArtworksController < ApplicationController

  def index
    # dumb = []
    # dumb << Artwork.find_by(artist_id: params[:user_id])
    # dumb << ArtworkShare.find_by(viewer_id: params[:user_id])
    # dumb
    render json: Artwork.all_user_artwork(params[:user_id])
  end

  def create
    @artwork = Artwork.new(artwork_params)

    if @artwork.save
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def show
    render json: Artwork.find(params[:id])
  end

  def update
    @artwork = Artwork.new(artwork_params)

    if @artwork.update
      render json: @artwork
    else
      render json: @artwork.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    @artwork = User.find_by(id: params[:id])

    if @artwork.destroy
      render json: @artwork
    else
      render json: user.errors.full_messages, status: :unprocessable_entity
    end
  end

  private
  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id)
  end

end
