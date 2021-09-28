require "rails_helper"

RSpec.describe ProtectedActionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/protected_actions").to route_to("protected_actions#index")
    end

    it "routes to #show" do
      expect(get: "/protected_actions/1").to route_to("protected_actions#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/protected_actions").to route_to("protected_actions#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/protected_actions/1").to route_to("protected_actions#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/protected_actions/1").to route_to("protected_actions#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/protected_actions/1").to route_to("protected_actions#destroy", id: "1")
    end
  end
end
