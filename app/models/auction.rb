class Auction < ApplicationRecord
  has_one :buyer, class_name: "User"
  has_one :seller, class_name: "User"
  has_many :bids

  validates_presence_of :title, :description, :start_date, :end_date
  
end
