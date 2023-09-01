

Feature: Test for the home page

    Background: Define url
        Given url apiUrl


    Scenario: Get all tags
        Given path "tags"
        When method get
        Then status 200
        And match response.tags contains "et"
        And match response.tags == "#array"
        And match each response.tags == "#string"


    
    Scenario: Get 10 articles from the home page 
        Given params {limit: 10,offset: 0}
        Given path 'articles'
        When method get
        Then status 200
        And match response.articles == '#[10]'
        And match response.articlesCount == 201

    

