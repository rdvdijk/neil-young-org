When /^I am logged in as an admin$/ do
  @current_user = Fabricate(:user)
  visit new_user_session_path
  fill_in "Email", :with => @current_user.email
  fill_in "Password", :with => @current_user.password
  find("input[type=submit]").click
end

When /^I am logged in as the feeds user$/ do
  auth_token = "SECRETTOKEN"
  @feeds_user = Fabricate(:user,
                          :email => "feedsuser@neilyoung.org",
                          :name => "Feeds user",
                          :authentication_token => auth_token)
  visit new_user_session_path(:auth_token => auth_token)
end

When /^I log out$/ do
  click_link "log out"
end

When /^I'm not logged in$/ do
  pending
end

