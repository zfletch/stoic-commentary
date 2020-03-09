require 'rails_helper'

RSpec.describe "passages/edit", type: :view do
  before(:each) do
    @passage = assign(:passage, Passage.create!(
      :ref => "MyString",
      :text => nil,
      :passage => "MyText",
      :rank => 1
    ))
  end

  it "renders the edit passage form" do
    render

    assert_select "form[action=?][method=?]", passage_path(@passage), "post" do

      assert_select "input[name=?]", "passage[ref]"

      assert_select "input[name=?]", "passage[text_id]"

      assert_select "textarea[name=?]", "passage[passage]"

      assert_select "input[name=?]", "passage[rank]"
    end
  end
end
