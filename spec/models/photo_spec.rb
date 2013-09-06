require 'spec_helper'

describe Photo do
  it "should have a name" do
    @photo=Photo.new
    @photo.name="test"
    @photo.name.should eq("test")
  end

  it "should have a URL" do
    @photo=Photo.new
    @photo.url="test"
    @photo.url.should eq("test")
  end

  it "should not be valid without a name" do
    @photo=Photo.new(url: "http://www.example.com", description: "test")
    @photo.should_not be_valid
  end

  it "should not be valid without a URL" do
    @photo=Photo.new(name: "test", description: "test")
    @photo.should_not be_valid
  end

  it "should be invalid with a duplicate URL" do
    @photo=Photo.new(url: "http://www.example.com", description: "test")
    @photo2=Photo.new(url: "http://www.example.com", description: "test")
    @photo2.should_not be_valid
  end

  it "has a vote field that is integer 0 and not nil when created" do
    @photo=Photo.new
    @photo.votes.should_not be_nil
  end

  it "has a vote_up method that increases the value of the vote integer" do
  @photo=Photo.new(name: "test", url: "http://www.example.com")
  @photo.save!
  original_votes = @photo.votes
  @photo.vote_up
  new_votes = @photo.votes
  new_votes.should > original_votes
  end

  it "has a vote_down method that decreases the value of the vote integer" do
  @photo=Photo.new(name: "test", url: "http://www.example.com")
  @photo.save!
  original_votes = @photo.votes
  @photo.vote_down
  new_votes = @photo.votes
  new_votes.should < original_votes
  end
end
