@javascript

Feature: Edit Author
  In order to edit an author
  
  Scenario: Successfull update of author
    Given these users exist
      And I am on the authors page
    When I follow "Villasica, Leo" then "Edit"
      And I fill in the following:
        | First name  | Leo Martin|
        | Last name   | Villasica |
        | Remarks     | haha      |
      And I select date "April 3, 1990" from "Birthday"
      And I press "Update Author"
    Then I should see "author was successfully updated."
  
  Scenario: Left first name blank
    Given these users exist
      And I am on the authors page
    When I follow "Terdes, Tudor" then "Edit"
      And I fill in the following:
        | First name  |           |
        | Last name   | Villasica |
        | Remarks     | haha      |
      And I select date "April 3, 1990" from "Birthday"
      And I press "Update Author"
    Then I should see "First name can't be blank"

  Scenario: Left last name blank
    Given these users exist
      And I am on the authors page
    When I follow "Villasica, Leo" then "Edit"
      And I fill in the following:
        | First name  | Leo Martin|
        | Last name   |           |
        | Remarks     | haha      |
      And I select date "April 3, 1990" from "Birthday"
      And I press "Update Author"
    Then I should see "Last name can't be blank"
      
