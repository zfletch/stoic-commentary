require 'rails_helper'

RSpec.describe "texts/edit", type: :view do
  before(:each) do
    @text = assign(:text, Text.create!(
      :urn => "MyString"
    ))
  end

  it "renders the edit text form" do
    render

    assert_select "form[action=?][method=?]", text_path(@text), "post" do

      assert_select "input[name=?]", "text[urn]"
    end
  end
end
