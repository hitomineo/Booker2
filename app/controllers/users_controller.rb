class UsersController < ApplicationController
     before_action :authenticate_user!
     before_action  :ensure_current_user, only:[:edit]

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
      @books = @user.books
    end

    def index
         @users = User.all
         @user = current_user
         @book=Book.new
    end

    def edit
       @user = User.find(params[:id])
    #   redirect_to(user_path) unless @user == current_user
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

def ensure_current_user
   user = User.find(params[:id])
unless user == current_user
   redirect_to(user_path(current_user.id))
end
end

end