class Plan < ApplicationRecord
 has_many :features, dependent: :destroy
 
 validates :plan_name, :monthly_fee, presence: true
end
