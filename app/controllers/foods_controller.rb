class FoodsController < ApplicationController
    before_action :authenticate_user!
    
    def index
      @foods=Food.all

        if params[:search] == nil
          @foods= Food.all
        elsif params[:search] == ''
          @foods= Food.all
        else
          #部分検索
          @foods = Food.where("name LIKE ? ",'%' + params[:search] + '%')
        end

        if params[:tag_ids]
          @foods = []
          params[:tag_ids].each do |key, value|      
            @foods += Tag.find_by(name: key).foods if value == "1"
          end
          @foods.uniq!
        end

    end
    
    def new
        @food = Food.new
      end
    
      def create
        food = Food.new(food_params)
        if food.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end
    def show
        @food = Food.find(params[:id])
      end

    def edit
        @food = Food.find(params[:id])
    end

    def update
        food = Food.find(params[:id])
        if food.update(food_params)
          redirect_to :action => "show", :id => food.id
        else
          redirect_to :action => "new"
        end
    end

    def destroy
        food = Food.find(params[:id])
        food.destroy
        redirect_to action: :index
    end

      private
    def food_params
        params.require(:food).permit(:name, :genre, :body, :image,:body, tag_ids: [])
    end
     
end