class UsersController < ApplicationController
    before_action :authenticate_user!

    def new
       @user = User.new
    end

    def create
        user = User.new(list_params)
        user.save
        redirect_to '/users_show'
      # else
          # render :index
      # end
    end

     def show
         @user = User.find(params[:id])
         @book = Book.new
     end

    def index
         @users = User.all
         @user = current_user
         @book=Book.new
    end

    def edit
       @user = User.find(params[:id])
    end

    def update
       @user = User.find(params[:id])
      if @user.update(user_params)
         flash[:notice] = "You have updated user successfully."
         redirect_to user_path(@user.id)
     else
         render :edit
     end
    end

  private
  # ストロングパラメータ
  def user_params
     params.require(:user).permit(:name, :introduction, :profile_image)
  end

end