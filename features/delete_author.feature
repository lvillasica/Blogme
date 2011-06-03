@javascript

Feature: Delete Author
  In order to delete an author

  Scenario: Successfull deletion of author
    Given these users exist
      And I am on the authors page
    When I follow "Villasica, Leo" then "Delete"
      And I confirm popup
    Then I should not see "Villasica, Leo"
  
  Scenario: Decline to delete author
    Given these users exist
      And I am on the authors page
    When I follow "Villasica, Leo" then "Delete"
      And I didn't confirm popup
      And I follow "Back"
    Then I should see "Villasica, Leo"
