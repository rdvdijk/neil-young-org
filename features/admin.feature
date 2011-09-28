Feature: Accepting links

  In order to add links to the site
  As an admin
  I want to be able to accept links

  Background:
    When I am logged in
    And there are submitted links
    And I visit the submitted links page

  Scenario: List submitted links
    Then I should see the submitted link

  Scenario: Show submitted link
    When I click on the title of the submitted link
    Then I should see the link acceptance form

  Scenario: Edit submitted link
    When I click on the title of the submitted link
    And I change the title of the link
    Then I should see the changed title

  Scenario: Accept submitted link
    When I click on the title of the submitted link
    And I accept the link
    Then I should see the submitted link on the frontpage

  Scenario: Deny submitted link
    When I click on the title of the submitted link
    And I deny the link
    Then I should not see the submitted link
    And I should not see the submitted link on the frontpage

  Scenario: Accept submitted link shows next
    When there is another submitted link
    And I click on the title of the submitted link
    And I accept the link
    Then I should see another submitted link form


