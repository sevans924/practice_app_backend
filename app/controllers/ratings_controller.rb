class RatingsController < ApplicationController
    before_action :find_rating, only: [:show, :edit, :update, :destroy]
   
    def index
      @ratings = Rating.all
    end
  
    # def about
    #   render :aboutpage
    # end
  
    def show
    end
  
    def new
      # @rating = rating.new
    end
  
    def create
      @rating = Rating.new(rating_params)
  
      if @rating.valid?
        @rating.save
        redirect_to @rating
      else
        redirect_to new_rating_path
      end
    end
  
    def edit
    end
  
    def update
      @rating.update(rating_params)
      redirect_to @rating
    end
  
    def destroy
      @rating.destroy
      redirect_to ratings_path
    end
  
    private
    #strong params
    def rating_params
      params.require(:rating).permit(:user_id, :beer_id, :rating_num, :review)
    end
  
    def find_rating
      @rating = Rating.find(params[:id])
    end
end
