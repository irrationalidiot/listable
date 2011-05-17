Feature: Add a list
  In order to organize things
  As a user
  I want to add a list

  Scenario: Adding a list
    Given I am on the home page
    And I follow "Add list"
    When I fill in "Name" with "Groceries"
    And I press "Add"
    Then I should be on the "Groceries" list page
    And I should see "List added"
    And I should see "Groceries"

  Scenario: Adding a list that already exists
    Given I am on the home page
    And I have a list named "Groceries"
    And I follow "Add list"
    When I fill in "Name" with "Groceries"
    And I press "Add"
    Then I should be on the new list page
    And I should see "Failed to add list"
    And I should see "Name has already been taken"
