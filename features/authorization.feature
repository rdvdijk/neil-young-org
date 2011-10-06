Feature: Authorizating

  In order to secure the site beyond authentication
  As a user with a specific role
  I can only do what I'm allowed to do

  # anonymous visitors
  Scenario:
    When I'm not logged in
    And I visit the link submission form
    Then I should not be asked to sign in

  Scenario:
    When I'm not logged in
    And I visit the admin pages
    Then I should be asked to sign in

  # feeds user
  Scenario:
    When I am logged in as the feeds user
    And I visit the link submission form
    Then I should not be asked to sign in

  @wip
  Scenario:
    When I am logged in as the feeds user
    And I visit the admin pages
    Then I should see that I'm not authorized

  Scenario:
    When I am logged in as the feeds user
    And there is a visible link
    Then I can't edit the link

  # admin users
  Scenario:
    When I am logged in as an admin
    And I visit the admin pages
    Then I should not be asked to sign in

  Scenario:
    When I am logged in as an admin
    And there is a visible link
    Then I am allowed to edit the link

