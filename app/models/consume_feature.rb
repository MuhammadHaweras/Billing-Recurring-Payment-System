class ConsumeFeature < ApplicationRecord
  belongs_to :subscription
  belongs_to :feature
end
