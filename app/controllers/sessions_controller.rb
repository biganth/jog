class SessionsController < ApplicationController
  
   def create
     user = User.from_omniauth(env['omniauth.auth'])
     session[:user_id] = user.id
     redirect_to root_url, notice: "You are signed in #{'current_user.name'}"
   end

   def destroy
     session[:user_id] = nil
     redirect_to root_url, notice: "You signed out"
   end
 end