require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it "gets a list of cats" do
      Cat.create(
        name: 'Felix',
        age: 2,
        enjoys: 'Walks in the park',
        image: 'sample'
      )
      get '/cats'

      cat = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat.length).to eq 1
    end
  end

  describe "POST /create" do
    it "creates a cat" do
      cat_params = {
        cat: {
          name: 'Buster',
          age: 4,
          enjoys: 'Meow Mix, and plenty of sunshine.',
          image: 'sample'
        }
      }
      post '/cats', params: cat_params

      expect(response).to have_http_status(200)

      cat = Cat.first

      expect(cat.name).to eq 'Buster'
    end
  end

  describe "PATCH /update" do
    it "updates a cat's info" do
      cat_params = {
        cat: {
          name: 'Buster',
          age: 4,
          enjoys: 'Meow Mix and plenty of sunshine.',
          image: 'sample'
        }
      }
      post '/cats/', params: cat_params
      cat = Cat.first

      updated_params = {
        cat: {
          name: 'Felix',
          age: 4,
          enjoys: 'Meow Mix and plenty of sunshine',
          image: 'sample'
        }
      }
      patch "/cats/#{cat.id}", params: updated_params

      updated_cat = Cat.find(cat.id)
      expect(response).to have_http_status(200)
      expect(updated_cat.name).to eq "Felix"

    end
  end

  describe "DELETE /destroy" do
    it "destroys a cat" do
      cat_params = {
        cat: {
          name: 'Felix',
          age: 3,
          enjoys: 'Food',
          image: 'sample'
        }
      }
      post '/cats', params: cat_params
      cat = Cat.first

      delete "/cats/#{cat.id}"

      expect(response).to have_http_status(200)
      expect(Cat.count).to eq 0

    end
  end

end
