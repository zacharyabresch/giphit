#!/usr/bin/env ruby
require 'httparty'
require 'json'
require 'uri'

GIPHY_ENDPOINT = 'api.giphy.com'

class Giphit
  include HTTParty
  base_uri GIPHY_ENDPOINT

  def initialize(api_key)
    @api_key = api_key
    @query_options = {
      query: { api_key: @api_key },
      format: :json
    }
  end

  ##
  # Get a random GIF
  # Accepts a string `tag` and a string `rating`
  # Returns OpenStruct of gif details
  def random(tag: nil, rating: nil)
    # TODO: Add tag and rating parameters
    response = get_response(
      api_path: '/v1/gifs/random',
      query_object: { tag: tag, rating: rating }
    )

    OpenStruct.new({
      page_url: response.parsed_response["data"]["url"],
      image_url: response.parsed_response["data"]["image_url"]
    })
  end

  ##
  # Do a search with the passed query term
  # Returns JSON results
  def search(q)
    response = get_response(
      api_path: '/v1/gifs/search',
      query_object: { q: URI.escape(q) }
    )
    response.parsed_response["data"]
  end

  private
    def get_response(api_path:, query_object: {})
      new_opts = {
        query: @query_options[:query].merge(query_object)
      }
      self.class.get(api_path, @query_options.merge(new_opts))
    end
end