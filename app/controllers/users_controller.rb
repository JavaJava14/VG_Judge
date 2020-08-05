class UsersController <  ApplicationController
  before_action :current_user, only: [:show]
  before_action :require_login, only: [:show, :most_users]

  def new
    if !current_user
      @user = User.new
    else
      redirect_to user_path(current_user)
    end
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @game = Game.all
  end

  def most_users
    @users = User.most_reviews
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end