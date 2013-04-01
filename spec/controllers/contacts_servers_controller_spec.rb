require 'spec_helper'

describe ContactsServersController do

  describe "GET 'assign'" do
    it "returns http success" do
      get 'assign'
      response.should be_success
    end
  end

end
