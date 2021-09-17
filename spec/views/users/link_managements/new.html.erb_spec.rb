require 'rails_helper'

RSpec.describe "users/link_managements/new", type: :view do
  before(:each) do
    assign(:users_link_management, Users::LinkManagement.new)
  end

  it "renders new users_link_management form" do
    render

    assert_select "form[action=?][method=?]", users_link_managements_path, "post" do
    end
  end
end
