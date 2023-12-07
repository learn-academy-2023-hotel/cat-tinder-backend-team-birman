require 'rails_helper'

RSpec.describe Cat, type: :model do
  it "should validate name" do 
    cat = Cat.create(
      age: 2,
      enjoys: 'Walks in the park',
      image: 'sample'
      )
    expect(cat.errors[:name]).to_not be_empty
  end

  it "should validate age" do
    cat = Cat.create(
      name: "Ralph",
      enjoys: "food",
      image: 'sample2'
    )
    expect(cat.errors[:age]).to_not be_empty
  end

  it "should validate enjoys" do
    cat = Cat.create(
      name: "Alex",
      age: 8,
      image: 'sample3'
    )
    expect(cat.errors[:enjoys]).to_not be_empty
  end

  it "should validate image" do
    cat = Cat.create(
      name: "Justin",
      age: 6,
      enjoys: "no pictures"
    )
    expect(cat.errors[:image]).to_not be_empty
  end

  it "it enjoys should be at least 10 characters long" do
    cat = Cat.create(
      name: "Kevin",
      age: 10,
      enjoys: "lessthan1",
      image: "sample4"
    )
    expect(cat.errors[:enjoys]).to_not be_empty
  end
  

end
