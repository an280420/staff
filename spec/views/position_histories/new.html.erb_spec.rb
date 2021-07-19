require 'rails_helper'

RSpec.describe "position_histories/new", type: :view do
  before(:each) do
    assign(:position_history, PositionHistory.new(
      name: "MyString",
      position: nil
    ))
  end

  it "renders new position_history form" do
    render

    assert_select "form[action=?][method=?]", position_histories_path, "post" do

      assert_select "input[name=?]", "position_history[name]"

      assert_select "input[name=?]", "position_history[position_id]"
    end
  end
end
