require 'rails_helper'

RSpec.describe "passages/show", type: :view do
  before(:each) do
    @passage = assign(:passage, Passage.create!(
      :ref => "Ref",
      :text => nil,
      :passage => "MyText",
      :rank => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Ref/)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
