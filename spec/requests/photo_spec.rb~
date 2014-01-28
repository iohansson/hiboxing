require 'spec_helper'

describe "photo index page" do
  before do
    visit '/'
    click_link 'Фото'
  end
  it "renders photos" do
    expect(page.all('.image').count).to eq(Photo.count)
  end
end 
