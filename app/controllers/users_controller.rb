class UsersController < ApplicationController

    before_action :find_student, only: [:show, :edit, :update, :delete]

          def index
            @users = User.all
            render json: @users
          end 

          def show
            render json: @user
          end

          def edit
            binding.pry
            # newStudentInfo = params
            # @student.update(params)
            # @student.save
          end


          def create
              @user = User.new(user_params)
      
              if @user.valid?
                @user.save
                render json: @user
              else
                render json: {
                  status: 'error',
                  message: 'Invalid Username or Password',
                  code: 422
                 }
              end
              
            end
            
          def update
              @student.update(student_params)
              render json: @student
          end

                 
      private
            def find_user
              @user = User.find(params[:id])
          end


          def user_params
              params.require(:user).permit(:first_name, :last_name, :email, :password_digest)
          end

    end
  end
end


end
