class User < ActiveRecord::Base
  has_many :experiences
  has_many :events, through: :experiences

  attr_accessor :name
    @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

end
