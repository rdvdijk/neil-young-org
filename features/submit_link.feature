Feature: Submitting links

  In order to add links to the site
  As an anonymous user
  I want to be able to submit a link

  Scenario: Submitting a link with required fields
    When I visit the link submission form
    And I submit a link with all required fields
    Then I should see a submission confirmation message

  Scenario: Submitting a link with too few fields
    When I visit the link submission form
    And I submit a link without all required fields
    Then I should see the form again
    And I should see error messages on the missing fields

  Scenario: Select category for new link
    When I visit the link submission form
    Then I can select a category

  Scenario: Verify visibility of link after submission
    When I visit the link submission form
    And I submit a link with all required fields
    Then I don't see the link on the frontpage

