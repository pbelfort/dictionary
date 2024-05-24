@history
Feature: History Page Integration Test

  @debug
  Scenario: Check History Item
      Given I am in route home
      And I wait app to stop
      When I tap the text "Hello"
      And I wait app to stop
      And I tap the close icon
      And I wait app to stop
      And I tap the text "History"
      Then I expect the text "hello" to be present