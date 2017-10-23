#!/usr/bin/env ruby
require 'httparty'
require 'json'

GIPHY_ENDPOINT = 'api.giphy.com'

class Giphit
  include HTTParty
  base_uri GIPHY_ENDPOINT

  def initialize(api_key)
    @api_key = api_key
    @query_options = {
      query: { api_key: @api_key }
    }
  end

  def random
    # Get a random GIF
    # TODO: Add tag and rating parameters
    search_path = '/v1/gifs/random'
    response = self.class.get(
      search_path, {
        query: { api_key: @key },
        format: :json
      })

    OpenStruct.new({
      page_url: response.parsed_response["data"]["url"],
      image_url: response.parsed_response["data"]["image_url"]
    })
  end

  def search(q)
    # Do a search with the term & return JSON
    # TODO: DRY up this search & query path construction ... it's _gross_.
    # TODO: Run some code quality tools once this gets close
    search_path = '/v1/gifs/search'
    response = self.class.get(
      search_path, {
        query: {
          api_key: @key,
          q: q,
        },
        format: :json
      })
    response.parsed_response["data"]
  end

  private
    def build_search_path(api_path:, query_object:)
      response = self.class.get(api_path)
    end
end