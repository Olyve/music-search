# Class for connecting to the Apple Music API
class AppleMusicService
  BASE_URL = 'https://api.music.apple.com/v1'.freeze
  HEADERS = {
    'Authorization' => 'Ahlx2XDjPQl/UqPHfk6L1NJQa/fHyzWzCc61L7FsQ/+wmQucAA/R/fWLob49MlT1LiiTDxm8nZqDB35qdjq9uEtw2+sDPYiqokkBVd2kLcjK94Z9qhx089FLyl5epw4gDDC4WJlhS0l9E7oUG77vNe2MwIkffdksTyhzFSkPAFIa/rzerdAUhjfiOyt0qMflN02YcScW6hKaSgxv7kPu7sOZ2BcH9F/jrfJiwQeTvqdc8Lr3WQ==)'
  }.freeze
  STOREFRONT = 'us'.freeze

  def search(search_term)
    query = {
      'term' => search_term,
      'type' => 'songs,albums'
    }
    HTTParty.get("#{BASE_URL}/catalog/#{STOREFRONT}/search",
                 headers: HEADERS,
                 query: query)
  end
end
