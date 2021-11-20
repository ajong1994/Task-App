require 'rails_helper'

RSpec.describe "Categories", type: :request do
  before :all do
    Category.create(name:"Sample")
  end
  describe "GET /index" do
    it "returns index page" do
      get categories_path
      expect(response).to have_http_status(200)
      expect(assigns(:categories)).to eq(Category.all)
    end
  end

  describe "1. As a User, I want to create a category that can be used to organize my tasks" do
    it "GET /new" do
      get new_category_path
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
    end

    it "POST /create" do
      expect{ post categories_path, params: {category:{name:'Test'}} }.to change(Category, :count).by(+1)
      expect(response).to redirect_to(categories_path)
      follow_redirect!
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
      get edit_category_path(43)
      expect(response).to have_http_status(200)
      expect(response).to render_template(:edit)
    end

    it "PATCH /category" do
      patch category_path(43), params: {category:{name:'Revised'}}
      # get categories_path
      expect(response).to redirect_to(categories_path)
      follow_redirect!
      expect(response).to render_template(:index)
    end
    # context 'Page does not submit when user submits a category with blank name field'

    # end
    # context 'Page redirects to index page with updated name of edited category'

    # end
  end

  describe '3. As a User, I want to view a category to show the category\'s details' do
    it "GET /:id" do
      get category_path(43)
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
    end
    # context 'Route to category page when I click View button of that category on the index'

    # end
    # context 'Show page should display category name'

    # end
  end
end
