Feature: Administration
  As a site owner
  In order to keep info on my site safe
  I want to restrict access to administration
    
  Scenario: admin dashboard
    When I login
    Then I should see administration area
