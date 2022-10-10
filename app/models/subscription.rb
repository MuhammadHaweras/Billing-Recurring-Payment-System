class Subscription < ApplicationRecord
  belongs_to :user
  belongs_to :plan
  has_many :consume_features, dependent: :destroy
end
