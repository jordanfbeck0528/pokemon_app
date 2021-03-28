class PokemonController < ApplicationController
  def index
# we change it from ".get" to ".new" to make a general call (you want this to be the base domain, so not https://pokeapi.co/api):
# require "pry"; binding.pry
    pokemon = params[:pokemon]
    conn = Faraday.new("https://pokeapi.co")
# now we specify which "extension" we want to connect with:
    response = conn.get("/api/v2/pokemon-form/#{pokemon}/")
# we create an instance variable since we will use it in our view, this is the information we will have access to by using the keys to retrieve values.
    @pokemon = JSON.parse(response.body, symbolize_names: true)
  end
end
