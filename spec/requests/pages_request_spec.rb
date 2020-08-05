require 'rails_helper'

RSpec.describe "Home Page", type: :request do
  # describe "#home" do
  #   it "responds successfully" do
  #     get :home
  #     expect(response).to be_success
  #   end
  #   it " returns a 200 response" speo
  #     get :home
  #     expect(response).to have_http_status "200"
  #   end
  # end

  it "responds successfully" do
    get root_path
    expect(response).to have_http_status "200"
  end
end
