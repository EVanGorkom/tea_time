class Subscription < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :frequency, presence: true
  validates :status, presence: true

  belongs_to :customer
  has_many :tea_subscriptions
  has_many :teas, through: :tea_subscriptions
end
