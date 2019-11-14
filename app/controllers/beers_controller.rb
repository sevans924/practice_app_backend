class BeersController < ApplicationController

    before_action :find_beer, only: [:show, :edit, :update, :destroy]
    def index
      @beers = Beer.all
      @user = current_user.id
    end
  
    # def about
    #   render :aboutpage
    # end
  
    def show
    end
  
    def new
      # @beer = Beer.new
    end
  
    def create
      @beer = Beer.new(beer_params)
  
      if @beer.valid?
        @beer.save
        redirect_to @beer
      else
        redirect_to new_beer_path
      end
    end
  
    def edit
    end
  
    def update
      @beer.update(beer_params)
      redirect_to @beer
    end
  
    def destroy
      @beer.destroy
      redirect_to beers_path
    end
  
    private
    #strong params
    def beer_params
      params.require(:beer).permit(:name, :abv, :isOrganic, :category, :description)
    end
  
    def find_beer
      @beer = Beer.find(params[:id])
    end

end
