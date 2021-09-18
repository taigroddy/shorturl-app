require 'rails_helper'

RSpec.describe "users/link_managements/show", type: :view do
  before(:each) do
    @link = assign(:users_link_management, Users::LinkManagement.create!)
  end

  it "renders attributes in <p>" do
    render
  end
end
