require 'rails_helper'

RSpec.describe "texts/index", type: :view do
  before(:each) do
    assign(:texts, [
      Text.create!(
        :urn => "Urn"
      ),
      Text.create!(
        :urn => "Urn"
      )
    ])
  end

  it "renders a list of texts" do
    render
    assert_select "tr>td", :text => "Urn".to_s, :count => 2
  end
end
