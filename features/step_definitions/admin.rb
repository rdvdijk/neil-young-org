When /^I am logged in$/ do
  @current_user = Fabricate(:user)
  visit new_user_session_path
  fill_in "Email", :with => @current_user.email
  fill_in "Password", :with => @current_user.password
  find("input[type=submit]").click
end

When /^I log in as the feeds user$/ do
  auth_token = "SECRETTOKEN"
  @feeds_user = Fabricate(:user, :email => "feedsuser@neilyoung.org", :authentication_token => auth_token)
  visit new_user_session_path(:auth_token => auth_token)
end

When /^I log out$/ do
  click_link "log out"
end

When /^there are submitted links$/ do
  @submitted_link = Fabricate(:link)
end

When /^I visit the submitted links page$/ do
  visit admin_links_path
end

# adding links as admin
When /^I submit a link on the admin page$/ do
  fill_in "URL",          :with => "http://github.com/"
  fill_in "Title",        :with => "Admin submitted link"
  fill_in "Description",  :with => "A description."
  submit_form
end

Then /^I should see the link directly on the frontpage$/ do
  visit root_path
  page.should have_content("Admin submitted link")
end

Then /^I should not see the accept and deny buttons$/ do
  page.should_not have_selector("input[value='accept link']")
  page.should_not have_selector("input[value='deny link']")
end

# submitted links:
Then /^I should see the submitted link on the admin page$/ do
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

# feed links:
Then /^I should see the feeds link on the admin page$/ do
  visit admin_links_path
  page.should have_content("Interesting Inc.")
end

Then /^the feed user is the author$/ do
  page.should have_content("feedsuser")
end

# verifying links:
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

When /^there is another submitted link$/ do
  @another_submitted_link = Fabricate(:link, :title => "Another link")
end

Then /^I should see another submitted link form$/ do
  page.should have_simple_form(admin_link_path(@another_submitted_link))
  page.should have_selector("input[type=text]", :value => @another_submitted_link.title)
end

Then /^I should be the verifier of the submitted link$/ do
  @submitted_link.reload.verifier.should == @current_user
end

Then /^I should see the reported broken link$/ do
  page.should have_content(@visible_link.title)
end

When /^I confirm the broken link$/ do
  click_link "confirm"
end

When /^I deny the broken link report$/ do
  click_link "deny"
end

Then /^I should not see the the reported broken link$/ do
  page.should_not have_content(@dead_link.title)
end

