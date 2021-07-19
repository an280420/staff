require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        l_name: "L Name",
        f_name: "F Name",
        s_name: "S Name"
      ),
      User.create!(
        l_name: "L Name",
        f_name: "F Name",
        s_name: "S Name"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", text: "L Name".to_s, count: 2
    assert_select "tr>td", text: "F Name".to_s, count: 2
    assert_select "tr>td", text: "S Name".to_s, count: 2
  end
end
