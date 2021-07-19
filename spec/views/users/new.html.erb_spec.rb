require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      l_name: "MyString",
      f_name: "MyString",
      s_name: "MyString"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[l_name]"

      assert_select "input[name=?]", "user[f_name]"

      assert_select "input[name=?]", "user[s_name]"
    end
  end
end
