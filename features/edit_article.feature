@javascript

Feature: Edit an article
  In order to edit an article
  
  Scenario: Successful update of article
    Given these articles and users exist
      And I am on the articles page
    When I follow "An article" then "Edit"
      And I fill in "Title" with "Updated article"
      And I select "Terdes, Tudor" from "article_author_id"
      And I fill in "Body" with "Updated... hahaha."
      And I select "Draft" from "Status"
      And I press "Update Article"
    Then I should see "Article was successfully updated."

  Scenario: Left Title blank
    Given these articles and users exist
      And I am on the articles page
    When I follow "An article" then "Edit"
      And I fill in "Title" with ""
      And I select "Terdes, Tudor" from "article_author_id"
      And I fill in "Body" with "Updated... hahaha."
      And I select "Draft" from "Status"
      And I press "Update Article"
    Then I should see "Title can't be blank"

  Scenario: Left Body blank
    Given these articles and users exist
      And I am on the articles page
    When I follow "An article" then "Edit"
      And I fill in "Title" with "Updated article"
      And I select "Terdes, Tudor" from "article_author_id"
      And I fill in "Body" with ""
      And I select "Draft" from "Status"
      And I press "Update Article"
    Then I should see "Body can't be blank"


