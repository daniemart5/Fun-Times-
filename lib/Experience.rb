class Experience < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  attr_accessor :rating, :review, :rsvp
    @@all = []
  def initialize(rating, review, rsvp)
    @rating = rating
    @review = review
    @rsvp = rsvp
    @@all << self
  end

  def self.all
    @all
  end

end
