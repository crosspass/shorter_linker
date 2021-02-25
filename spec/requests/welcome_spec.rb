require 'rails_helper'

RSpec.describe "/welcome", type: :request do
  describe "GET /welcome" do
    it "renders a successful response" do
      get '/'
      expect(response).to be_successful
    end
  end
end
