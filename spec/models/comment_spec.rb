require 'spec_helper'

describe Comment do
  it "requires a text field" do
    comment=Comment.new
    comment.should_not be_valid
  end
end
