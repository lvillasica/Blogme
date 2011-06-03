@javascript

Feature: Delete an article
  In order to delete an article
  
  Scenario: Successful deletion of article
    Given these articles and users exist
      And I am on the articles page
    When I follow "An article" then "Delete"
      And I confirm popup
    Then I should not see "An article"
  
  Scenario: Decline to delete an article
    Given these articles and users exist
      And I am on the articles page
    When I follow "An article" then "Delete"
      And I didn't confirm popup
      And I follow "Back"
    Then I should see "An article"
      
