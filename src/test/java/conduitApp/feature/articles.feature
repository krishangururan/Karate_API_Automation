Feature: Articles

Background: Define URL
    Given url apiUrl
    # * def tokenResponse = callonce read('classpath:helpers/CreateToken.feature')
    # * def token = tokenResponse.authToken








    @debug
    Scenario:Create a new article and delete it
    # Given header Authorization = 'Token '+token
    Given path 'articles'
    * def requestBody = {"article": {"title":"Karate Title7","description":"testing","body":"to check karate","tagList": []}}
    And request requestBody
    When method Post
    Then status 201
    And match response.article.title == requestBody.article.title

    * def articleId = response.article.slug
    # Given header Authorization = 'Token '+token
    Given path 'articles',articleId
    When method delete
    Then status 204

    Given params {limit: 10,offset: 0}
    Given path 'articles'
    When method Get
    Then status 200
    And match response.articles[0].title != requestBody.article.title






    