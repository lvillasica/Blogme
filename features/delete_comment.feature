@javascript

Feature: Delete a comment
  In order to delete a comment
  
  Scenario: Successful Update of a comment
    Given these articles and users exist
      And this comment exists
      And I am on the articles page
    When I follow "An article" then "Comments"
      And I follow "fx_great@yahoo.com" then "Delete"
      And I confirm popup 
    Then I should not see "comment..."

  Scenario: Successful Update of a comment
    Given these articles and users exist
      And this comment exists
      And I am on the articles page
    When I follow "An article" then "Comments"
      And I follow "fx_great@yahoo.com" then "Delete"
      And I didn't confirm popup
      And I follow "Back"
    Then I should see "comment..."
