Feature: Sign up new user

  Background: Preconditions
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * def userData = {"email": "search4vivek007@gmail.com","password":"vidady123","username":"vidady"}
    * def randomEmail = dataGenerator.getRandomEmail()
    * def randomUsername = dataGenerator.getRandomUsername()
    * url apiUrl
    * print apiUrl



  Scenario: New user sign up with static data generator method
    Given path "users"
    And request

      """

      {

        "user": {

          "email": "#(randomEmail)",

          "password": "#(userData.password)",

          "username": "#(randomUsername)"

        }

      }

      """
    When method Post
    Then status 201
    And match response ==

      """

      {

        "user": {

          "email": "#string",

          "username": "#string",

          "bio": null,

          "image": "#string",

          "token": "#string"

        }

      }

      """


  Scenario: New user sign up with non static data generator method
    * def jsFunction =

      """
    function(){
    var DataGenerator = Java.type('helpers.DataGenerator')
    var generator = new DataGenerator()
    return generator.getNonStaticUsernameMethodData()

    } 
    """

    * def randomUsername2 = call jsFunction
    Given path "users"
    And request

    """    
    {
        "user": {
          "email": "#(randomEmail)",
          "password": "#(userData.password)",
          "username": "#(randomUsername2)"
        }
      }  
      
      
      """

    When method Post
    Then status 201
    And match response ==

      """

      {

        "user": {

          "email": "#string",

          "username": "#string",

          "bio": null,

          "image": "#string",

          "token": "#string"

        }

      }

      """


  Scenario Outline: Validate Sing up error messages

    Given path 'users'
    And request
      """
    {
    "user":{
    "email": '<email>',
    "password":"<password>",
    "username":"<username>"
    }
    }
    """

    When method Post
    Then status 422
    Then match response == <errorResponse>


    Examples:
      | email                     | password  | username          | errorResponse                                                                         |
      | #(randomEmail)            | vidady123 | vidady            | {"errors":{"username":["has already been taken"]}}                                    |
      | search4vivek007@gmail.com | vidady123 | vidady            | {"errors":{"email":["has already been taken"],"username":["has already been taken"]}} |
      | search4vivek007@gmail.com | vidady123 | (#randomUsername) | {"errors":{"email":["has already been taken"],"username":["has already been taken"]}}



