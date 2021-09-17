require "rails_helper"

RSpec.describe Users::LinkManagementsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/users/link_managements").to route_to("users/link_managements#index")
    end

    it "routes to #new" do
      expect(get: "/users/link_managements/new").to route_to("users/link_managements#new")
    end

    it "routes to #show" do
      expect(get: "/users/link_managements/1").to route_to("users/link_managements#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/users/link_managements/1/edit").to route_to("users/link_managements#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/users/link_managements").to route_to("users/link_managements#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/users/link_managements/1").to route_to("users/link_managements#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/users/link_managements/1").to route_to("users/link_managements#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/users/link_managements/1").to route_to("users/link_managements#destroy", id: "1")
    end
  end
end
