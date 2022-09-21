class User < ApplicationRecord

  devise :invitable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  enum role: [:admin, :buyer]

      
end
