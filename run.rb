# https://docs.google.com/spreadsheets/d/1lOzuYOb8mHNnMuv2Gdmipx3k24e2yLSyIX2u4lDj5Vg/pub?gid=0&single=true&output=csv

require 'net/http'
require 'pry'
require_relative 'schedule'
require_relative 'time_slot'

uri = URI('https://docs.google.com/spreadsheets/d/1lOzuYOb8mHNnMuv2Gdmipx3k24e2yLSyIX2u4lDj5Vg/pub?gid=0&single=true&output=csv')
string = 

schedule = Schedule.new(Net::HTTP.get(uri))

puts 'asd'