require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      l_name: "MyString",
      f_name: "MyString",
      s_name: "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input[name=?]", "user[l_name]"

      assert_select "input[name=?]", "user[f_name]"

      assert_select "input[name=?]", "user[s_name]"
    end
  end
end
