Then /^I should not be asked to sign in$/ do
  page.should_not have_selector("input[type=password]")
end

Then /^I should be asked to sign in$/ do
  page.should have_selector("input[type=password]")
end

Then /^I should see that I'm not authorized$/ do
  page.should have_content("You are not authorized to visit that page.")
end

Then /^I am allowed to edit the link$/ do
  visit root_path
  click_link "edit"
  page.should have_selector("input[type='submit'][value='edit link']")
end
