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
end
