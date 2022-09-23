class Buyer::UsersController < ApplicationController
  
  def index
  	@users = User.buyer_role
  end	
end	
