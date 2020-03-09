require 'rails_helper'

RSpec.describe "passages/new", type: :view do
  before(:each) do
    assign(:passage, Passage.new(
      :ref => "MyString",
      :text => nil,
      :passage => "MyText",
      :rank => 1
    ))
  end

  it "renders new passage form" do
    render

    assert_select "form[action=?][method=?]", passages_path, "post" do

      assert_select "input[name=?]", "passage[ref]"

      assert_select "input[name=?]", "passage[text_id]"

      assert_select "textarea[name=?]", "passage[passage]"

      assert_select "input[name=?]", "passage[rank]"
    end
  end
end
