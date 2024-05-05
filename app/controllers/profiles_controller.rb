class ProfilesController < ApplicationController
  def show
    @admin_users = User.all
    
  end
  
end
