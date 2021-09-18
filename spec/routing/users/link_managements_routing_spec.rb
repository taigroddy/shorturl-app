require "rails_helper"

RSpec.describe Users::LinkManagementsController, type: :routing do
  # rubodop:disable Metrics/BlockLength
  describe "routing" do
    it "routes to #index" do
      expect(get: "/links").to route_to("users/link_managements#index")
    end

    it "routes to #new" do
      expect(get: "/links/new").to route_to("users/link_managements#new")
    end

    it "routes to #show" do
      expect(get: "/links/1").to route_to("users/link_managements#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/links/1/edit").to route_to("users/link_managements#edit", id: "1")
    end

    it "routes to #create" do
      expect(post: "/links").to route_to("users/link_managements#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/links/1").to route_to("users/link_managements#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/links/1").to route_to("users/link_managements#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/links/1").to route_to("users/link_managements#destroy", id: "1")
    end
  end
  # rubodop:enable Metrics/BlockLength
end
