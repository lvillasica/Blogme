@javascript

Feature: Add new comment
  In order to add a new comment

  Scenario: Successful adding of comment
    Given these articles and users exist
      And I am on the articles page
    When I follow "An article" then "Comments"
      And I follow "New Comment"
      And I fill in the following:
        | Email | fx_great@yahoo.com  |
        | Body  | hahaha...           |
      And I press "Create Comment"
    Then I should see "comment was successfully created"

  Scenario: Invalid email format
    Given these articles and users exist
      And I am on the articles page
    When I follow "An article" then "Comments"
      And I follow "New Comment"
      And I fill in the following:
        | Email | dfsdfdfsdsd         |
        | Body  | hahaha...           |
      And I press "Create Comment"
    Then I should see "Email is invalid"

  Scenario: Forgot to fill email
    Given these articles and users exist
      And I am on the articles page
    When I follow "An article" then "Comments"
      And I follow "New Comment"
      And I fill in the following:
        | Email |                     |
        | Body  | hahaha...           |
      And I press "Create Comment"
    Then I should see "Email can't be blank"

  Scenario: Forgot to fill email
    Given these articles and users exist
      And I am on the articles page
    When I follow "An article" then "Comments"
      And I follow "New Comment"
      And I fill in the following:
        | Email | fx_great@yahoo.com  |
        | Body  |                     |
      And I press "Create Comment"
    Then I should see "Body can't be blank"

