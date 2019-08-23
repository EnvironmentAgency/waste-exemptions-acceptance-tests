@backoffice @renew
Feature: [RUBY-241] Back office user carries out a renewal
  As an admin agent
  I need to renew on behalf of an assisted digital user
  So that our data is up to date

  # This feature will only work on the test environment, where renewals can be done instantly.

  Background: Register an exemption
    Given my business is a "limited_company"
     When I register an exemption
     Then I will be informed the registration is complete

  Scenario: Renew a registration from back office without changes
    Given I sign in as an admin agent
     When I search for a registration to renew
      And I renew the registration "without" changes
     Then I can see the correct renewed details
      And I can renew it again

  Scenario: Renew a registration from back office with changes
    Given I sign in as a super agent
     When I search for a registration to renew
      And I renew the registration "with" changes
     Then I can see the correct renewed details
      And I can renew it again

  Scenario: Cancel renewal
    Given I sign in as an admin agent
      And I search for a registration to renew
     When I partially renew the registration
     Then I can resume the renewal from where I left off