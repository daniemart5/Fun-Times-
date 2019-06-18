class Event < ActiveRecord::Base
  has_many :experiences
  has_many :events, through: :experiences

  attr_accessor :name, :location, :date, :price
    @@all = []
  def initialize(name, location, date)
    @city_name = city_name
    @location = location
    @date = date
    @price = price
    @@all << self
  end

  def self.all
    @@all
  end

end
