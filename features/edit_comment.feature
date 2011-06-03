@javascript

Feature: Edit a comment
  In order to edit a comment
  
  Scenario: Successful Update of a comment
    Given these articles and users exist
      And this comment exists
      And I am on the articles page
    When I follow "An article" then "Comments"
      And I follow "fx_great@yahoo.com" then "Edit"
      And I fill in the following:
        | Email | update@yahoo.com  |
        | Body  | updated comment   |
      And I press "Update Comment"
    Then I should see "comment was successfully updated."
  
  Scenario: Invalid email format
    Given these articles and users exist
      And this comment exists
      And I am on the articles page
    When I follow "An article" then "Comments"
      And I follow "fx_great@yahoo.com" then "Edit"
      And I fill in the following:
        | Email | dfsdfdfsdsd         |
        | Body  | hahaha...           |
      And I press "Update Comment"
    Then I should see "Email is invalid"

  Scenario: Left email blank
    Given these articles and users exist
      And this comment exists
      And I am on the articles page
    When I follow "An article" then "Comments"
      And I follow "fx_great@yahoo.com" then "Edit"
      And I fill in the following:
        | Email |                     |
        | Body  | hahaha...           |
      And I press "Update Comment"
    Then I should see "Email can't be blank"

  Scenario: Left body blank
    Given these articles and users exist
      And this comment exists
      And I am on the articles page
    When I follow "An article" then "Comments"
      And I follow "fx_great@yahoo.com" then "Edit"
      And I fill in the following:
        | Email | fx_great@yahoo.com  |
        | Body  |                     |
      And I press "Update Comment"
    Then I should see "Body can't be blank"
