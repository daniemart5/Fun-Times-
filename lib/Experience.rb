class Experience < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  attr_accessor :rating, :review, :rsvp

  def initialize(rating, review, rsvp)
    @rating = rating
    @review = review
    @rsvp = rsvp
  end
end
