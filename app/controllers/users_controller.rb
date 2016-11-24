class UsersController < Clearance::UsersController
  
  skip_before_action :require_login, :only => [:create]

  layout 'alt_layout'

  def show
  end

  def create
    @user = User.new(user_params)
    puts "In"
    puts "User #{@user}"
      if @user.save
        sign_in @user
        puts "Url After #{url_after_create}"
        redirect_back_or url_after_create
      else
        puts "Url After ##### #{url_after_create}"
        puts "Url After ##### #{@user.errors.full_messages}"
        redirect_to root_url
      end  
      
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
