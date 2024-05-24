@home
Feature: Home Page Integration Test

  @debug
  Scenario: Check home UI
    Given I am in route home
    Then I expect the text "Word list" to be present
    And I expect the text "History" to be present
    And I expect the text "Favorites" to be present
    And I expect the text "Center" to be present