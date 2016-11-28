class UsersController < Clearance::UsersController
  
  skip_before_action :require_login, :only => [:create, :new]
  layout 'alt_layout'
  
  def show
    @user = User.find_by_id(params[:id])
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
        UserMailer.welcome_email(@user).deliver_later
        format.html { redirect_back_or url_after_create }
        format.js { redirect_back_or url_after_create }
      else
        flash.now[:notice] = @user.errors.full_messages.first
        format.html { render :action => :new }
        format.js
      end  
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

  def destroy_avatar
    @avatar = User.find(params[:id]).avatar
    @avatar.destroy
    redirect_to user_path(params[:id])
  end

  private 
  def user_params
     params.require(:user)
     .permit(:first_name, :last_name, :email, :password, :birthday, :gender, :phone_number, :state, :country, :zip_code)
  end

end
