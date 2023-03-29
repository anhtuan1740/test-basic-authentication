class SessionsController < ApplicationController
  def new; end
  def create
    user = User.find_by(email: params[:email])
    if user.present?
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to root_path, notice: 'Login successfully'
      else
        flash[:alert] = "Invalid email or password"
        redirect_to root_path
      end
    else
      user = User.create(email: params[:email], password: params[:password])
      if user.save!
        session[:user_id] = user.id
        redirect_to root_path, notice: 'Successfully created account'
      end
    end
  end

  def destroy
    # deletes user session
    session[:user_id] = nil
    redirect_to root_path
  end
end
