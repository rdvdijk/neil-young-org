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
