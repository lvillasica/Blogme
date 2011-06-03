@javascript

Feature: Add Author
  In order to add author
  
  Scenario: Successful addition of author
    Given I am on the authors page
    When I follow "New Author"
      And I fill in the following:
        | First name  | Leo       |
        | Last name   | Villasica |
        | Remarks     | haha      |
      And I select date "April 3, 1990" from "Birthday"
      And I press "Create Author"
    Then show me the page
  
  Scenario: Forgot to fill first name
    Given I am on the authors page
    When I follow "New Author"
      And I fill in the following:
        | First name  |           |
        | Last name   | Villasica |
        | Remarks     | haha      |
      And I select date "April 3, 1990" from "Birthday"
      And I press "Create Author"
    Then I should see "First name can't be blank"

  Scenario: Forgot to fill last name
    Given I am on the authors page
    When I follow "New Author"
      And I fill in the following:
        | First name  | Leo       |
        | Last name   |           |
        | Remarks     | haha      |
      And I select date "April 3, 1990" from "Birthday"
      And I press "Create Author"
    Then I should see "Last name can't be blank"
  
