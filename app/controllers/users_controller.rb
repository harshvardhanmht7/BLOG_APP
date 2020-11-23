class UsersController < ApplicationController

   def show
     @user = User.find(params[:id])
     @articles=@user.articles
   end


    def  new
      @user=User.new
    end

    def create
      @user=User.new(user_params)
      if @user.save
        flash[:notice]="user created succesfully";
        redirect_to articles_path
      else
        render new
      end
    end

    def edit
      @user= User.find(params[:id])
    end

    def  update
          @user= User.find(params[:id])
          if @user.save
            flash[:notice]="user updated succesfully";
            redirect_to articles_path
          else
            render new
          end

    end

 private
    def user_params
      params.require(:user).permit(:username, :email , :password)
    end



end
