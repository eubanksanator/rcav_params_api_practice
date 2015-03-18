require 'open-uri'
require 'json'

class PagesController < ApplicationController


def pirate
  url = "http://isithackday.com/arrpi.php?text=#{params['address']}&format=json"
  # grab the URL we need from the API

  @response = open(url).read
  # allow rails to open that url and read it
  @parsed = JSON.parse(@response)
  # take that url and parse it into JSON format



end

end
