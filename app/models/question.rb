class Question < ActiveRecord::Base
  extend FriendlyId

  belongs_to :user
  belongs_to :category
  has_many :answers

  attr_accessible :topic, :text, :description, :slug, :preferences

  validates :text, presence: true

  store :preferences, accessors: [:share_on, :post_annonymously]

  alias_attribute :title, :text

  friendly_id :text, use: :slugged

  attr_accessor :topic

  scope :by_user,     lambda {|user| where(user_id: user.is_a?(user) ? user.id : user) }
  scope :in_category, lambda {|category| where(category_id: category.is_a?(Category) ? category.id : category) }

end

