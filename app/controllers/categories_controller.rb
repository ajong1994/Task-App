class CategoriesController < ApplicationController
    before_action :get_category, only: %w[show edit update]

    def index 
        @categories = Category.all
    end

    def new
        @category = Category.new
    end

    def create
        @category = Category.new(category_params)

        if @category.save 
            redirect_to categories_path
        else
            render :new
        end
    end

    def show
        @tasks = @category.tasks.all 
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

    private 

    def get_category
        @category = Category.find(params[:id])
    end

    def category_params
        params.require(:category).permit(:name)
    end
end
