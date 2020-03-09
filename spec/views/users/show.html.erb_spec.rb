require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :email => "",
      :name => "Name",
      :password_digest => "Password Digest",
      :role => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Password Digest/)
    expect(rendered).to match(/2/)
  end
end
