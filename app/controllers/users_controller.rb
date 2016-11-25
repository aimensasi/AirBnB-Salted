class UsersController < Clearance::UsersController
  
  skip_before_action :require_login, :only => [:create, :new]

  layout 'alt_layout'

  def show
  end

  def new
    @user = User.new

    respond_to do |format|
      format.html { render 'new' }
      format.js
    end
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|

      if @user.save
        sign_in @user
        format.html { redirect_back_or url_after_create }
        format.js
      else
        format.html { render 'new' }
        format.js
      end  

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
