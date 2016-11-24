class UsersController < Clearance::UsersController
  
  skip_before_action :require_login, :only => [:create]

  layout 'alt_layout'

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_back_or url_after_create
    else
      redirect_to root_url
    end
  end

  def edit
  	@user = User.find(params[:id])
  	render 'edit'
  end

  def update
    @user = User.find_by_id(params[:id])
    @user.avatar = params[:user][:avatar]
    if @user.save
      render 'update'
    else
      puts "EROOR #{@user.errors.full_messages}"
      render 'edit'
    end
  end

  def destroy
  end

  private 
  def user_params
     params.require(:user)
     .permit(:first_name, :last_name, :email, :password, :birthday, :gender, :phone_number, :state, :country, :zip_code)
  end

end
