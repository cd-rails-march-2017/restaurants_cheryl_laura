class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :restaurant
  validates :stars, numericality: { greater_than: 0, less_than: 6}
end
