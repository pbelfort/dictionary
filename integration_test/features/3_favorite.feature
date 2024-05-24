@favorite
Feature: Favorite List Integration Test

@debug
  Scenario: Check Favorite List
    Given I am in route home
    And I wait app to stop
    When I tap the text "Favorites"
    And I wait app to stop
    Then I expect the text "You dont have any item in favorite list!" to be present

@debug
  Scenario: Favorite Item
    Given I am in route home
    When I tap the text "Center"
    And I wait app to stop
    And I tap the star icon
    And I wait app to stop
    And I tap the close icon
    And I tap the text "Favorites"
    Then I expect the text "center" to be present

@debug
  Scenario: Unfavorite Item
    Given I am in route home
    When I tap the text "Center"
    And I wait app to stop
    And I tap the star icon
    And I wait app to stop
    And I tap the close icon
    And I tap the text "Favorites"
    Then I expect the text "You dont have any item in favorite list!" to be present