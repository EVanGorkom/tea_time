class TeaSubscription < ApplicationRecord
  validates :tea_id, presence: true
  validates :subscription_id, presence: true

  belongs_to :tea
  belongs_to :subscription
end
