Feature: Remotely submitting links

  In order to add links from feeds to the site
  As a specific feeds user
  I want to be able to submit a link remotely

  Scenario: Submitting a link remotely
    When I am logged in as the feeds user
    And I visit the link submission form
    And I submit a feed link with all required fields
    And I log out
    And I am logged in as an admin
    Then I should see the feeds link on the admin page
    And the feed user is the creator

