Feature: News management
  As a site owner
  In order to keep info up-to-date
  I want to add some news
  
  Background:
    Given I have following news:
    | title   | text |
    | big new | ooh  |
    | disorder| ooh  |
    | big new | ooh  |
    | big new | ooh  |
    | not new | ooh  |
    
  Scenario: Latest news display on home page
    When I go to the home page
    Then I should see 3 latest news
    
  Scenario: Adding news
    When admin adds a new "Sorry, guys, no training today"
    Then I should see "Sorry, guys, no training today" on club index page
    
  Scenario: News index by pages
    When I go to the news index page
    Then I should see all news separated by pages
