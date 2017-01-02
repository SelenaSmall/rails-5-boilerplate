class UsersController < HomeController
	before_action :authenticate_user!
	before_action :set_user, only: [:show, :edit]

	def index
		@users = User.all
	end

	def show
	end	

	def new
		@user = User.new
	end

	def edit
	end

	def create
		@user = User.new(user_params)

	    respond_to do |format|
	      if @user.save
	        format.html { redirect_to @user, notice: 'user was successfully created.' }
	      else
	        format.html { render :new }
	      end
	    end
	end

	def update
	end

	def destroy
	end

	private

	def user_params
    	params.require(:user).permit(:role)
  	end

	def set_user
		@user = User.find(params[:id])
	end

end
