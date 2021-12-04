class CategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :get_category, only: %w[show edit update destroy]

    def index 
        @categories = current_user.categories
    end

    def new
        @category = current_user.categories.new
    end

    def create
        @category = current_user.categories.new(category_params)

        if @category.save 
            redirect_to categories_path
        else
            render :new
        end
    end

    def show
        @tasks = @category.tasks
    end

    def edit
    
    end

    def update
        if @category.update(category_params)
            redirect_to categories_path
        else
            render :edit
        end
    end

    def destroy
        @category.destroy
        redirect_to categories_path
    end

    private 

    def get_category
        @category = current_user.categories.find(params[:id])
    end

    def category_params
        params.require(:category).permit(:name)
    end
end
