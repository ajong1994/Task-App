require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "GET /index" do
    it "returns index page" do
      get categories_path
      expect(response).to have_response_status(200)
      expect(assigns(:categories)).to eq(Category.all)
    end
  end

  describe "1. As a User, I want to create a category that can be used to organize my tasks" do
    it "GET /new" do
      get new_category_path
      expect(response).to have_response_status(200)
      expect(response).to render_template(:new)
    end

    it "POST /create" do
      post :create, category:{name:'Test'}
      expect(response).to have_response_status(200)
      expect(response).to render_template(:index)
    end
    # context 'Page does not submit when user submits a category with blank name field'
    #   post create_category_path


    # end
    # context 'Page redirects to index page with updated list of categories'

    # end
  end

  describe '2. As a User, I want to edit a category to update the category\'s details' do
    it "GET /edit" do
      get edit_category_path, id: 2
      expect(response).to have_response_status(200)
      expect(response).to render_template(:edit)
    end

    it "POST /create" do
      patch :update, id: 2, category:{name:'Revised'}
      expect(response).to have_response_status(200)
      expect(response).to render_template(:index)
    end
    # context 'Page does not submit when user submits a category with blank name field'

    # end
    # context 'Page redirects to index page with updated name of edited category'

    # end
  end

  describe '3. As a User, I want to view a category to show the category\'s details' do
    it "GET /:id" do
      get category_path, id: 2
      expect(response).to have_response_status(200)
      expect(response).to render_template(:show)
    end
    # context 'Route to category page when I click View button of that category on the index'

    # end
    # context 'Show page should display category name'

    # end
  end
end
