require 'spec_helper'

describe UsersController do
  render_views
  
  
  describe "DELETE 'destroy'" do
    before(:each) do
      @user = Factory(:user)
      @admin = Factory(:user, :email => "admin@example.com", :admin => true)    
      
      @users = [@user, @admin]
    end
    
    describe "as a non-signed-in user" do
      it "should deny access" do
        delete :destroy, :id => @user
        response.should redirect_to(signin_path)
      end
    end
    
    describe "as a non-admin user" do
      it "should protect the page" do
        sign_in(@user)
        delete :destroy, :id => @user
        response.should redirect_to(root_path)
      end
    end
    
    describe "as an admin user" do
      before(:each) do

        sign_in(@admin)
      end
      
      it "should destroy the user" do
        lambda do
          delete :destroy, :id => @user
        end.should change(User, :count).by(-1)
      end
      
      it "should redirect to the users page" do
        delete :destroy, :id => @user
        response.should redirect_to(users_path)
      end
      
      it "should not be able to destroy themselves" do
        lambda do
          delete :destroy, :id => @admin
        end.should_not change(User, :count)
      end
        
    end
  end

end