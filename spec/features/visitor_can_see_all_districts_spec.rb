require 'rails_helper'

describe "a visitor can see a list of all districts" do
  it "a visitor can see a list of all DPS districts" do
    district1 = create(:district)
    district2 = create(:district)
    visit "/districts"

    expect(current_path).to eq(districts_path)
    expect(page).to have_content("#{district1.name}")
    expect(page).to have_content("#{district2.name}")
    expect(page).to have_content("#{district1.board_member}")
    expect(page).to have_content("#{district2.board_member}")
  end
end
