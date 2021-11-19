require 'rails_helper'

describe Category, type: :model do
    let(:category) {Category.new}
    context '1. As a User, I want to create a cateogry that can be used to organize my tasks' do
        it 'User should be able to create a Category' do
            category.name = 'Sample'
            category.save

            expect(Category.count).to eq(1)
        end

        it 'Category creation should be rejected if name is blank' do
            category.name = nil

            expect(category).to_not be_valid
        end
    end

    context '2. As a User, I want to edit a category to update the category\'s details' do
        it 'Editing category name should be allowed' do
            category.name = "Sample"
            category.save
            edited_category = Category.find_by(name: "Sample")
            edited_category.update(name: "Sample Revised")

            expect(edited_category.name).to eq("Sample Revised")
        end
    end

    context '3. As a User, I want to view a category to show the category\'s details' do
        it 'Viewing a specific category' do
            category.name = "Sample"
            category.save

            expect(category.name).to eq("Sample")
            expect(Category.find_by(name:"Sample")).to be_a_kind_of Category
        end
    end
end