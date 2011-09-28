When /^I am logged in$/ do
  @current_user = Fabricate(:user)
  visit new_user_session_path
  fill_in "Email", :with => @current_user.email
  fill_in "Password", :with => @current_user.password
  find("input[type=submit]").click
end

When /^there are submitted links$/ do
  @submitted_link = Fabricate(:link)
end

When /^I visit the submitted links page$/ do
  visit admin_links_path
end

Then /^I should see the submitted link$/ do
  page.should have_content(@submitted_link.title)
end

Then /^I should not see the submitted link$/ do
  page.should_not have_content(@submitted_link.title)
end

When /^I click on the title of the submitted link$/ do
  click_link @submitted_link.title
end

Then /^I should see the link acceptance form$/ do
  page.should have_simple_form(admin_link_path(@submitted_link))
end

When /^I change the title of the link$/ do
  fill_in "Title", :with => "A different title"
  submit_form
end

Then /^I should see the changed title$/ do
  page.should have_content("A different title")
end

When /^I accept the link$/ do
  click_button "accept link"
end

When /^I deny the link$/ do
  click_button "deny link"
end
