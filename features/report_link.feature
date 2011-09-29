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

  @wip
  Scenario: Show reported broken links in admin
    When I visit the frontpage
    And I report a link
    And I am logged in
    And I visit the submitted links page
    Then I should see the reported broken link
