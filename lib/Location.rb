class Location < ActiveRecord::Base
  belongs_to :event

  attr_accessor :city_name

  def initialize(city_name)
    @city_name = city_name
  end 
end
