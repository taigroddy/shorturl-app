require 'rails_helper'

RSpec.describe "users/link_managements/edit", type: :view do
  before(:each) do
    @link = assign(:users_link_management, Users::LinkManagement.create!)
  end

  it "renders the edit users_link_management form" do
    render

    assert_select "form[action=?][method=?]", users_link_management_path(@link), "post" do
    end
  end
end
