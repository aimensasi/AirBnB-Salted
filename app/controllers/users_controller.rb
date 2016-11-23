class UsersController < Clearance::UsersController
  


  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      
    else

    end
    redirect_to root_url
  end

  def edit
  	@user = User.find(params[:id])
  	render 'edit'
  end

  def update
  end

  def destroy
  end

  private 
  def user_params
     params.require(:user)
     .permit(:first_name, :last_name, :email, :password, :birthday, :gender, :phone_number, :state, :country, :zip_code)
  end

end
