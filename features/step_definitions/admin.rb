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

