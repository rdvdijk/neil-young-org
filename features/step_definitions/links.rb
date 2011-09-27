When /^I visit the link submission form$/ do
  visit new_link_path
end

When /^I submit a link with all required fields$/ do
  fill_in "URL",          :with => "http://www.google.com/"
  fill_in "Title",        :with => "Google"
  fill_in "Description",  :with => "Don't be evil."
  submit_form
end

When /^I submit a link without all required fields$/ do
  submit_form
end

Then /^I should see a confirmation message$/ do
  page.should have_content("Thank you for your link! A moderator will take a look at it soon.")
end

Then /^I should see the form again$/ do
  page.should have_selector("form[action='#{links_path}']")
end

Then /^see error messages on the missing fields$/ do
  field_with_errors("URL").should_not be_nil
  field_with_errors("Title").should_not be_nil
  field_with_errors("Description").should_not be_nil
end

