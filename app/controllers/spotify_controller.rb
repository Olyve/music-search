# Spotify Controller
class SpotifyController < ApplicationController
  SPOTIFY = SpotifyService.new

  # Returns the current users' Spotify profile
  def user
    render json: SPOTIFY.user
  end

  # Returns the results of the search
  def search
    render json: SPOTIFY.search(params[:search_term])
  end
end
