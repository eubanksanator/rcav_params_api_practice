require 'open-uri'
require 'json'

class PagesController < ApplicationController
  def pirate

    url = "http://isithackday.com/arrpi.php?text=#{params['sentence']}"
    @translated_text = open(url).read
  end

  def image
    url = "http://en.wikipedia.org/w/api.php?action=query&titles=#{params['search']}&prop=images&format=json"
    @response = open(url).read
    @parsed =  JSON.parse(@response)

    key = @parsed['query']['pages'].keys[0]
    file_name = @parsed['query']['pages'][key]['images'][0]['title']

    file_url = "http://en.wikipedia.org/w/api.php?action=query&titles=#{file_name}&prop=imageinfo&iiprop=url&format=json"

    @file_response = open(file_url).read
    @parsed_file_response = JSON.parse(@file_response)
    file_key = @parsed_file_response["query"]['pages'].keys[0]
    @image_url = @parsed_file_response['query']['pages'][file_key]['imageinfo'][0]['url']





  end
end
