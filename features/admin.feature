Feature: Accepting links

  In order to add links to the site
  As an admin
  I want to be able to accept links

  Background:
    When I am logged in
    And there are submitted links

  Scenario: List submitted links
    When I visit the submitted links page
    Then I should see the submitted link
