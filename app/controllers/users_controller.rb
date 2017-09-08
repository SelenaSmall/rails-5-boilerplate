class UsersController < HomeController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user

  def index
    @users = User.all
  end

  def show; end

  def new
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)

    if @user.save
      @user.invite!
      redirect_to users_path, notice: "#{@user[:email]} was created!"
    else
      redirect_to users_path, alert: "Unable to create user #{@user[:email]}. #{@user.errors.full_messages.join(', ')}"
    end
  end

  def update
    if @user.update(user_params)
      redirect_to users_path, notice: "#{@user[:email]} was updated!"
    else
      redirect_to users_path, alert: "Unable to update user. #{@user.errors.full_messages.join(', ')}"
    end
  end

  def destroy
    if @user.destroy
      redirect_to users_path, notice: "#{@user[:email]} was destroyed!"
    else
      redirect_to users_path, alert: "Unable to destroy user. #{@user.errors.full_messages.join(', ')}"
    end
  end

  private

  def user_params
    params.require(:user).permit(:role, :email, :password)
  end

  def set_user
    @user = User.find_by(id: params[:id])

    return redirect_to users_path, alert: 'That user does not exist' unless @user
  end

  def authorize_user
    @user.nil? ? authorize(User) : authorize(@user)
  end
end
