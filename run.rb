# https://docs.google.com/spreadsheets/d/1lOzuYOb8mHNnMuv2Gdmipx3k24e2yLSyIX2u4lDj5Vg/pub?gid=0&single=true&output=csv

require 'net/http'
require 'pry'

uri = URI('https://docs.google.com/spreadsheets/d/1lOzuYOb8mHNnMuv2Gdmipx3k24e2yLSyIX2u4lDj5Vg/pub?gid=0&single=true&output=csv')
binding.pry
string = Net::HTTP.get(uri)
puts 'asd'