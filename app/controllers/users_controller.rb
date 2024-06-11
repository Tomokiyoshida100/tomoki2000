class UsersController < ApplicationController
    def show
      @user = User.find(params[:id]) 
      if params[:tag_ids]
        @foods = []
        params[:tag_ids].each do |key, value|      
          @foods += Tag.find_by(name: key).foods if value == "1"
        end
        @foods.uniq!
      end

    end
  end