When /^I visit the frontpage$/ do
  visit root_path
end

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

Then /^I should see a submission confirmation message$/ do
  page.should have_content("Thank you for your link! A moderator will take a look at it soon.")
end

Then /^I should see the form again$/ do
  page.should have_simple_form(links_path)
end

Then /^I should see error messages on the missing fields$/ do
  field_with_errors("URL").should_not be_nil
  field_with_errors("Title").should_not be_nil
  field_with_errors("Description").should_not be_nil
end

Then /^I can select a category$/ do
  page.find_field "Category"
  page.select "Other", :from => "Category"
end

Then /^I don't see the link on the frontpage$/ do
  visit root_path
  page.should_not have_content(Link.last.title)
end

Then /^I should see the submitted link on the frontpage$/ do
  visit root_url
  page.should have_content(@submitted_link.title)
end

Then /^I should not see the submitted link on the frontpage$/ do
  visit root_url
  page.should_not have_content(@submitted_link.title)
end

Given /^there is a visible link$/ do
  @visible_link = Fabricate :link, :state => "accepted"
end

When /^I report a link$/ do
  click_link "report broken link"
end

Then /^I should see a report confirmation message$/ do
  page.should have_content("Thank you for reporting a broken link!")
end
