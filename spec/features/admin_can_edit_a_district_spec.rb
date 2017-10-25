require 'rails_helper'

describe "an admin can edit an existing district" do
  it "an admin can update an individual district details" do
    admin_user = create(:user, role: 1)
    district = create(:district)
    original_board_member = district.board_member
    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_user)
    visit edit_admin_district_path(district)

    expect(find_field("Board member").value).to eq "#{original_board_member}"

    fill_in "district[board_member]", with: "Fancy Person Name"
    click_button "Update District"

    expect(current_path).to eq(district_path(district))
    expect(page).to have_content("Fancy Person Name")
    expect(page).to_not have_content("#{original_board_member}")
  end
end
