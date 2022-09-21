class Buyer::UsersController < ApplicationController
  
  def index
  	@users = User.where(role: 'buyer')
  end	
  

 
end	