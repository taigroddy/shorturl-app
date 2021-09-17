require 'rails_helper'

RSpec.describe "users/link_managements/index", type: :view do
  before(:each) do
    assign(:users_link_managements, [
             Users::LinkManagement.create!,
             Users::LinkManagement.create!
           ])
  end

  it "renders a list of users/link_managements" do
    render
  end
end
