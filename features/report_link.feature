Feature: Reporting links

  In order to report broken links
  As an anonymous user
  I want to be able to report individual links

  Background:
    Given there is a visible link

  Scenario: Reporting a broken link
    When I visit the frontpage
    And I report a link
    Then I should see a report confirmation message

  Scenario: Show reported broken links in admin
    When I visit the frontpage
    And I report a link
    And I am logged in as an admin
    And I visit the submitted links page
    Then I should see the reported broken link

  Scenario: Confirm reported broken link
    When there is a broken link report
    And I am logged in as an admin
    And I visit the submitted links page
    And I confirm the broken link
    Then I should not see the the reported broken link
    And I should not see the reported link on the frontpage

  Scenario: Deny reported broken link
    When there is a broken link report
    And I am logged in as an admin
    And I visit the submitted links page
    And I deny the broken link report
    Then I should not see the the reported broken link
    And I should see the reported link on the frontpage
