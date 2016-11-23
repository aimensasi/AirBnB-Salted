class UsersController < Clearance::UsersController
  
  protect_from_forgery except: :show

  def show
  end

  def new
    @user = User.new
    respond_to do |format|
      format.html {render template: 'users/new'}
      format.js 
    end
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
