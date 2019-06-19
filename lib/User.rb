require 'pry'
class User < ActiveRecord::Base
  has_many :experiences
  has_many :events, through: :experiences
end
