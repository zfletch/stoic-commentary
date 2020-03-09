require 'rails_helper'

RSpec.describe "texts/show", type: :view do
  before(:each) do
    @text = assign(:text, Text.create!(
      :urn => "Urn"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Urn/)
  end
end
