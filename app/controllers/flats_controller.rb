require 'open-uri'
require 'json'

class FlatsController < ApplicationController
  before_action :get_flats
  def index
  end

  def show
    @flat = @flats.find { |flat| flat["id"] == params[:id].to_i}
  end

  private

  def get_flats
    url = "https://raw.githubusercontent.com/lewagon/flats-boilerplate/master/flats.json"
    flats_serialized = URI.open(url).read
    @flats = JSON.parse(flats_serialized).map { |flat| OpenStruct.new(flat)}
    raise
  end
end
