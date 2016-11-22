class UsersController < ApplicationController
  def show
    
  end

  def edit
  	@user = User.find(params[:id])
  	render 'edit'
  end

  def update
  end

  def destroy
  end
end
