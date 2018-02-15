# Class for connecting to the Spotify API
class SpotifyService
  BASE_URL = 'https://api.spotify.com/v1'.freeze
  HEADERS = {
    'Authorization' => "Bearer #{@current_user.spotify_token}"
  }.freeze

  def user
    HTTParty.get("#{BASE_URL}/me", headers: HEADERS)
  end

  def search(search_term)
    query = {
      'q' => search_term,
      'type' => 'track,album',
      'limit' => 5
    }
    HTTParty.get("#{BASE_URL}/search", headers: HEADERS, query: query)
  end
end
