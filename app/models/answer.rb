class Answer < ActiveRecord::Base
  extend FriendlyId

  belongs_to :user
  belongs_to :question

  attr_accessible :question_id, :text, :slug, :preferences

  validates :text, presence: true

  store :preferences, accessors: [:share_on, :post_annonymously]

  alias_attribute :title, :text

  friendly_id :text, use: :slugged

  attr_accessor :topic

  scope :by_user,     lambda {|user| where(user_id: user.to_param) }
  scope :to_question, lambda {|question| where(question_id: question.to_param) }

end

