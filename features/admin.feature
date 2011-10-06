Feature: Accepting links

  In order to add links to the site
  As an admin
  I want to be able to accept links

  Background:
    When I am logged in as an admin
    And there are submitted links
    And I visit the submitted links page

  Scenario: List submitted links
    Then I should see the submitted link on the admin page

  Scenario: Adding a link
    When I submit a link on the admin page
    Then I should see the link directly on the frontpage

  Scenario: Adding a link form buttons
    Then I should not see the accept and deny buttons

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

  Scenario: Accept submitted link verifier
    When I click on the title of the submitted link
    And I accept the link
    Then I should be the verifier of the submitted link

  Scenario: Deny submitted link
    When I click on the title of the submitted link
    And I deny the link
    Then I should not see the submitted link
    And I should not see the submitted link on the frontpage

  Scenario: Deny submitted link verifier
    When I click on the title of the submitted link
    And I deny the link
    Then I should be the verifier of the submitted link

  Scenario: Accept submitted link shows next
    When there is another submitted link
    And I click on the title of the submitted link
    And I accept the link
    Then I should see another submitted link form

  Scenario: Editing accepted links
    When there is a visible link
    And I edit that link
    Then I should see the changes on the frontpage

  Scenario: Can't edit links when logged out
    When there is a visible link
    And I log out
    Then I can't edit the link

