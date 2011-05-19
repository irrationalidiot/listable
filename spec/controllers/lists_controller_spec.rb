require "spec_helper"

describe ListsController do
  describe "GET index" do
    it "finds all lists" do
      @lists = [Factory(:list)]
      get :index
      assigns[:lists].should == @lists
    end
  end
end
