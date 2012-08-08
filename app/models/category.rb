class Category < ActiveRecord::Base
  extend FriendlyId
  friendly_id :name

  validates :name, presence: true, length: 2..64
end
