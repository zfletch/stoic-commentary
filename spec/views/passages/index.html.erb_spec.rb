require 'rails_helper'

RSpec.describe "passages/index", type: :view do
  before(:each) do
    assign(:passages, [
      Passage.create!(
        :ref => "Ref",
        :text => nil,
        :passage => "MyText",
        :rank => 2
      ),
      Passage.create!(
        :ref => "Ref",
        :text => nil,
        :passage => "MyText",
        :rank => 2
      )
    ])
  end

  it "renders a list of passages" do
    render
    assert_select "tr>td", :text => "Ref".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
