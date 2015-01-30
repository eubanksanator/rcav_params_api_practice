require 'open-uri'
require 'json'

class PagesController < ApplicationController
  def pirate
    url = "http://isithackday.com/arrpi.php?text=#{params['input']}&format=json"
    @response = open(url).read
    @parsed = JSON.parse(@response)

  end

  def image
    url = "http://en.wikipedia.org/w/api.php?action=query&titles=#{params['input']}&prop=images&format=json"
    @response = open(url).read
    @parsed = JSON.parse(@response)
    key = @parsed['query']['pages'].keys[0]
    @file_name = @parsed['query']['pages'][key]["images"][0]['title']

    file_url = "http://en.wikipedia.org/w/api.php?action=query&titles=#{@file_name}&prop=imageinfo&iiprop=url&format=json"
    encoded_url = URI.encode(file_url)
    @file_response = open(encoded_url).read


    @parsed_file = JSON.parse(@file_response)
    @file_key = @parsed_file['query']['pages'].keys[0]
    @url = @parsed_file['query']['pages'][@file_key]['imageinfo'][0]['url']

  end
end
