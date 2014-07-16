require "spec_helper"

feature "signup" do
  scenario "user can signup with email and password" do
    visit '/'

    fill_in "email", with: "sean@test.com"
    fill_in "password", with: "secret"
    click_button "Submit"

    expect(page).to have_content("Thanks for signing up!")
  end
end

feature "view" do
  scenario "user can view all the emails" do
    visit '/'
    fill_in "email", with: "sean@test.com"
    fill_in "password", with: "secret"
    click_button "Submit"

    click_button "View All Emails"

    expect(page).to have_content("sean@test.com")
  end
end
