# Class for connecting to the Spotify API
class SpotifyService
  BASE_URL = 'https://api.spotify.com/v1'.freeze
  USER_TOKEN = 'BQCu8zGLgSnUuaycQpSvOrRhkkpL9OLZUvJJHv08vfY8DvfxkNIbfPF8PETPjgt9LAfTnzjGyi6kqpN1mVKUqTwhVw--IOy12fvgWErzE-fEQJND4gBl0MmDnNywIZTAY2hR9PvOGcJxCVTeDVK_xLHFd_IxmGTF9UKk97auK2r4r4iWnoy9hF3nTYblAj8kP89sO5-_qRNvEwbOn5bV9MVB-g)'.freeze
  HEADERS = { 'Authorization' => "Bearer #{USER_TOKEN}" }.freeze

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
