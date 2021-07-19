require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      l_name: "L Name",
      f_name: "F Name",
      s_name: "S Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/L Name/)
    expect(rendered).to match(/F Name/)
    expect(rendered).to match(/S Name/)
  end
end
