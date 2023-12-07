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
          enjoys: 'Walks in the park',
          image: 'sample'
        }
      }
      post '/cats', params: cat_params
      cat = Cat.first

      delete "/cats/#{cat.id}"

      expect(response).to have_http_status(200)
      expect(Cat.find_by(id: cat.id)).to be_nil

    end
  end

  describe "cannot create a cat without valid attributes" do
    it "doesn't create a cat without a name" do
      cat_params = {
        cat: {
          age: 2,
          enjoys: 'Walks in the park',
          image: 'sample'
        }
      }
      post '/cats', params: cat_params
      expect(response.status).to eq 422

      cat = JSON.parse(response.body)
      expect(cat['name']).to include "can't be blank"
    end
  end

  describe "cannot create a cat without valid attributes" do
    it "doesn't create a cat without an age" do
      cat_params = {
        cat: {
          name: "Fred",
          enjoys: 'Walks in the park',
          image: 'sample'
        }
      }
      post '/cats', params: cat_params
      expect(response.status).to eq 422
      
      cat = JSON.parse(response.body)
      expect(cat['age']).to include "can't be blank"
    end
  end

  describe "cannot create a cat without valid attributes" do
    it "doesn't create a cat without an enjoys" do
      cat_params = {
        cat: {
          name: "Fred",
          age: 8,
          image: "sample"
        }
      }
      post '/cats', params: cat_params
      expect(response.status).to eq 422

      cat = JSON.parse(response.body)
      expect(cat['enjoys']).to include "can't be blank"
    end
  end

  describe "cannot create a cat without valid attributes" do
    it "doesn't create a cat without an image" do
      cat_params = {
        cat: {
          name: "Fred",
          age: 8,
          enjoys: "Hello World"
        }
      }
      post '/cats', params: cat_params
      expect(response.status).to eq 422
      
      cat = JSON.parse(response.body)
      expect(cat['image']).to include "can't be blank"
    end
  end

  # describe "cannot create a cat without valid length in enjoys" do
  #   it "doesn't create a cat without enjoys having a length less than 10" do
  #     cat_params = {
  #       cat: {
  #         name: "Fred",
  #         age: 10,
  #         enjoys: "Hello War",
  #         image: "sample8"
  #       }
  #     }
  #     post '/cats', params: cat_params
  #     expect(response.status).to eq 422

  #     cat = Cat.first

  #     # cat = JSON.parse(response.body)
  #     # expect(cat['enjoys']).to include "can't be less than 10 characters"
  #     # expect(cat['errors']['enjoys']).to include "is too short(minimum is 10 characters)"
  #     # expect(cat.enjoys.length).to be >= 10
  #     # expect(cat['enjoys'].length).to be >= 10
  #   end
  # end

  describe "cannot update a cat without valid attributes" do
    it "doesn't update a cat without an enjoys" do
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

      expect(response.status).to eq 422

      cat = JSON.parse(response.body)
      expect(cat['enjoys']).to include "can't be blank"
    end
  end


end
