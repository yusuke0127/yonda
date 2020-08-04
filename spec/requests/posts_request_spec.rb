require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "#index" do
    # it "responds successfully" do
    #   get :index
    #   expect(response).to be_success
    # end

    it "returns a 200 response" do
      get :index
      expect(response).to have_http_status "200"
    end
  end

  describe "#show" do
    before do
      @user = FactoryBot.create(:user)
      @post = FactoryBot.create(:post, user: @user)
    end

    # it "responds successfully" do
    #   get :show, params: { id: @post.id }
    #   expect(response).to be_success
    # end

    it "returns a 200 response" do
      get :show, params: { id: @post.id }
      expect(response).to have_http_status "200"
    end
  end

  describe "#create" do
    context "as an authenticated user" do
      before do
        @user = FactoryBot.create(:user)
      end

      it "adds a post" do
        post_params = FactoryBot.attributes_for(:post)
        sign_in @user
        expect {
          post :create, params: { post: post_params }
        }.to change(@user.posts, :count).by(1)
      end
    end
    context "as a guest" do
      it "returns a 302 response" do
        post_params = FactoryBot.attributes_for(:post)
        post :create, params: { post: post_params }
        expect(response).to have_http_status "302"
      end

      it "redirects to the sign_in page" do
        post_params = FactoryBot.attributes_for(:post)
        post :create, params: { post: post_params }
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe "#update" do
    context "as an authorized user" do
      before do
        @user = FactoryBot.create(:user)
        @post = FactoryBot.create(:post, user: @user)
      end

      it "updates a post" do
        post_params = FactoryBot.attributes_for(:post, title: "New Post Title")
        sign_in @user
        patch :update, params: { id: @post.id, post: post_params }
        expect(@post.reload.title).to eq "New Post Title"
      end
    end

    context "as an unauthorized user" do
      before do
        @user = FactoryBot.create(:user)
        other_user = FactoryBot.create(:user)
        @post = FactoryBot.create(
          :post,
          user: other_user,
          title: "Old Title"
        )
      end

      it "does not update the post" do
        post_params = FactoryBot.attributes_for(:post, title: "New Title")
        sign_in @user
        # patch :update, params: { id: @post.id, post: post_params }
        expect do
          patch :update, params: { id: @post.id, post: post_params }
        end.to raise_error Pundit::NotAuthorizedError
      end
    end
  end

end
# it "redirects to the sign-in page" do
#   project_params = FactoryGirl.attributes_for(:project)
#   post :create, params: { project: project_params }
#   expect(response).to redirect_to "/users/sign_in"
# end
