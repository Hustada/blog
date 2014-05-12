  
  describe "POST create" do
    describe "with valid params" do
      it "creates a new User" do
        expect {
          post: create, {:user => valid_attributes}, valid_session
          }.to change(User, :count).by(1)
      end
    end  
  end  
 





  it "sets the session user_id to the created user" do
    post :create, {:user => valid_attributes}, valid_session
    expect(session[:user_id]).to eq(User.find_by(email: valid_attributes["email"]))
  end
