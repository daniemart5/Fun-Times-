class Location < ActiveRecord::Base
  belongs_to :event

  attr_accessor :city_name
    @@all = []
  def initialize(city_name)
    @city_name = city_name
    @@all << self
  end

  def self.all
    @all
  end

end
