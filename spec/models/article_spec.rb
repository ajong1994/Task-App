require 'rails_helper'

describe Article, type: :model do
    let!(:article) {Article.new}

    context 'Validations' do
        it '1. is not valid without a name' do 
            article.body = 'Sample body'
            article.name = nil 

            expect(article).to_not be_valid
            expect(article.errors).to be_present
            expect(article.errors.to_hash.keys).to include(:name)
        end 

        it '2. is not valid without a body' do 
            article.name = 'Sample name'
            article.body = nil 

            expect(article).to_not be_valid
            expect(article.errors).to be_present
            expect(article.errors.to_hash.keys).to include(:body)
        end 

        it '3. is not valid with body length less than 5' do 
            article.name = 'Sample name'
            article.body = '123'

            expect(article).to_not be_valid
            expect(article.errors).to be_present
            expect(article.errors.to_hash.keys).to include(:body)
        end 

        it '4. is valid with body length greater than or equal to 5' do 
            article.name = 'Sample name'
            article.body = '12345'

            expect(article).to be_valid
            expect(article.errors).to_not be_present
            expect(article.errors.to_hash.keys).to_not include(:body)
        end 

        it '5. is not valid with duplicate article name' do
            article.name = 'Sample name'
            article.body = '12345'
            article.save
            new_article = Article.create(name:'Sample name', body:'Sample body')

            expect(new_article).to_not be_valid
            expect(new_article.errors).to be_present
            expect(new_article.errors.to_hash.keys).to include(:name)
        end 
    end
end