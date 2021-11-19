require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "GET /index" do
    it "returns index page" do
      get categories_path
      expect(response).to have_response_status(200)
    end
  end

  describe '1. As a User, I want to create a category that can be used to organize my tasks' do
    context 'Route to new Category path when user clicks create new category button on home page'

    end
    context 'Page does not submit when user submits a category with blank name field'

    end
    context 'Page redirects to index page with updated list of categories'

    end
  end

  describe '2. As a User, I want to edit a category to update the category\'s details' do
    context 'Route to specific Category edit page when edit link is clinked in index'

    end
    context 'Page does not submit when user submits a category with blank name field'

    end
    context 'Page redirects to index page with updated name of edited category'

    end
  end

  describe '3. As a User, I want to view a category to show the category\'s details' do
    context 'Route to category page when I click View button of that category on the index'

    end
    context 'Show page should display category name'

    end
  end
end
