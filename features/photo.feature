Feature: Photo management
  As a site owner
  In order to show everybody our club
  I want to upload some photos
  
  Background:
    Given I have following photos:
    | title | description | image |
    | new   | new photo   | 1.jpg |
    | old   | old photo   | 2.jpg |
    
  Scenario: Last photos display on main page
    When I go to the home page
    Then I should see 3 latest photos
    
  Scenario: adding photo
    When I add image "test.jpg" with title "test"
    Then I should see image "test.jpg" with title "test" on the home page
    
  Scenario: photos index
    When I go to the photos index page
    Then I should see all photos
