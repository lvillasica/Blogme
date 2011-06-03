@javascript

Feature: Add new article
  In order to add new article
  
  Scenario: Successful adding of article
    Given these users exist
      And I am on the articles page
    When I follow "New Article"
      And I fill in "Title" with "An article"
      And I select "Villasica, Leo" from "article_author_id"
      And I fill in "Body" with "hehehe..."
      And I select "Posted" from "Status"
      And I press "Create Article"
    Then show me the page

  Scenario: Forgot to fill Title
    Given these users exist
      And I am on the articles page
    When I follow "New Article"
      And I select "Villasica, Leo" from "article_author_id"
      And I fill in "Body" with "hehehe..."
      And I select "Posted" from "Status"
      And I press "Create Article"
    Then I should see "Title can't be blank"

  Scenario: Forgot to fill Body
    Given these users exist
      And I am on the articles page
    When I follow "New Article"
      And I fill in "Title" with "An article"
      And I select "Villasica, Leo" from "article_author_id"
      And I select "Posted" from "Status"
      And I press "Create Article"
    Then I should see "Body can't be blank"


