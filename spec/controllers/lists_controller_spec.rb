require "spec_helper"

describe ListsController do
  describe "GET index" do
    it "finds all lists" do
      @lists = [Factory(:list)]
      get :index
      assigns[:lists].should == @lists
    end
  end
  
  describe "GET new" do
    it "is successful" do
      get :new
      response.should be_success
    end
  end
  
  describe "POST create" do
    before(:each) do
      @list = mock_model(List, :save => nil)
      @params = { "name" => "Groceries" }
      List.stub(:new).and_return(@list)
    end
    
    it "creates a new list" do
      List.should_receive(:new).with(@params).and_return(@list)
      post :create, :list => @params
    end
    
    it "saves the new list" do
      @list.should_receive(:save)
      post :create, :list => @params
    end
    
    context "when the list saves successfully" do
      before(:each) do
        @list.stub(:save).and_return(true)
      end
      
      it "sets a flash[:notice] message" do
        post :create, :list => @params
        flash[:notice].should == "List added"
      end
      
      it "redirects to the lists index" do
        post :create, :list => @params
        response.should redirect_to(lists_url)
      end
    end
    
    context "when the list does not save successfully" do
      it "assigns @list"
      
      it "renders the new template"
    end
  end
end
