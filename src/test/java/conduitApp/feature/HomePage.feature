

Feature: Test for the home page

    Background: Define url
        Given url apiUrl


    Scenario: Get all tags
        Given path "tags"
        When method get
        Then status 200
        And match response.tags contains "et"
        And match response.tags contains any ['et','dog']
        And match response.tags == "#array"
        And match each response.tags == "#string"


    
    Scenario: Get 10 articles from the home page
        * def timeValidator = read('classpath:helpers/timeValidator.js')
        Given params {limit: 10,offset: 0}
        Given path 'articles'
        When method get
        Then status 200
        And match response.articles == '#[10]'
        And match response.articlesCount == 201
        And match response == {'articles': '#array','articlesCount': 201}
        And match response..bio contains null
        And match each response..following == false
        And match each response..following == "#boolean"
        And match each response..favoritesCount == '#number'
        And match each response..bio == '##string'
        And match each response.articles ==
        """

        """



    

