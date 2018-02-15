# Spotify Controller
class SpotifyController < ApplicationController
  SPOTIFY = SpotifyService.new
  APPLE_MUSIC = AppleMusicService.new

  # Returns the current users' Spotify profile
  def user
    render json: SPOTIFY.user
  end

  # Returns the results of the search
  def search
    search_term = params[:search_term]

    # Create Search
    search = Search.new(search_term: search_term, user: @current_user)
    search.save

    # Spotify Response
    spotify_response = SPOTIFY.search(search_term)
    # spotify_result =

    # Apple Music Response
    # apple_music_response = APPLE_MUSIC.search(search_term)

    # Get results from Spotify
    render json: spotify_response
  end
end
