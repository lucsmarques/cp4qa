#Author: profricardo.moura@fiap.com.br

@tag
Feature: Everything about your Pets
  Descrição da feature


  @tag1
  Scenario: Finds Pets by status
    Given url UrlBase
    And path 'findByStatus'
    And param status = 'available'
    When method GET
    Then status 200
    And match response[0].name contains 'fish'

    
  @tag2
  	Scenario: Find pet by ID
    Given url UrlBase
    And path 'pet' , '10'
    When method GET
    Then status 200

  @tag3
  	Scenario: Add a new pet to the store
    Given url UrlBase
    And request {"id":0,"category":{"id":0,"name":"string"},"name":"doggie","photoUrls":["string"],"tags":[{"id":0,"name":"string"}],"status":"available"}
    And path 'pet'
    When method POST
    Then status 200
    
    
   @tag4
    Scenario: Error
    Given url UrlBase
    And request {"id":0,"category":{"id":0,},"tags":[{"id":0,"name":"string"}],"status":"available"}
    And path 'pet'
    When method POST
    Then status 405
   
   