Feature: generating cucumber stories
  In order to get started using cucumber in a project
  A user should be able to
  generate a project setup for their testing framework of choice

  Scenario: sans cucumber setup
    Given a working directory
    And I have configured git sanely
    And I do not want cucumber stories
    When I generate a project named 'the-perfect-gem' that is 'zomg, so good'

    And a file named 'the-perfect-gem/features/the_perfect_gem.feature' is not created
    And a file named 'the-perfect-gem/features/support/env.rb' is not created
    And a file named 'the-perfect-gem/features/steps/the_perfect_gem_steps.rb' is not created
    
  Scenario: basic cucumber setup
    Given a working directory
    And I have configured git sanely
    And I want cucumber stories
    When I generate a project named 'the-perfect-gem' that is 'zomg, so good'

    Then cucumber directories are created

    And a file named 'the-perfect-gem/features/the_perfect_gem.feature' is created
    And a file named 'the-perfect-gem/features/support/env.rb' is created
    And a file named 'the-perfect-gem/features/steps/the_perfect_gem_steps.rb' is created

    And 'features/support/env.rb' requires 'the_perfect_gem'

  Scenario: cucumber setup for bacon
    Given a working directory
    And I have configured git sanely
    And I want cucumber stories
    When I generate a bacon project named 'the-perfect-gem' that is 'zomg, so good'

    Then 'features/support/env.rb' requires 'test/unit/assertions'
    And 'features/support/env.rb' sets up features to use test/unit assertions

  Scenario: cucumber setup for minitest
    Given a working directory
    And I have configured git sanely
    And I want cucumber stories
    When I generate a minitest project named 'the-perfect-gem' that is 'zomg, so good'

    Then 'features/support/env.rb' requires 'mini/test'
    And 'features/support/env.rb' sets up features to use minitest assertions

  Scenario: cucumber setup for rspec
    Given a working directory
    And I have configured git sanely
    And I want cucumber stories
    When I generate a rspec project named 'the-perfect-gem' that is 'zomg, so good'

    Then 'features/support/env.rb' requires 'the_perfect_gem'
    And 'features/support/env.rb' requires 'spec/expectations'
