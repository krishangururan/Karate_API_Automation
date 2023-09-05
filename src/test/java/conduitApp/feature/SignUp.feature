Feature: Sign up new user

  Background: Preconditions
    * def dataGenerator = Java.type('helpers.DataGenerator')
    Given url apiUrl

    Scenario: New user sign up
#      Given def userData = {"email": "search4vivek007@gmail.com","password":"vidady123","username":"vidady"}
      * def randomEmail = dataGenerator.getRandomEmail()
      * def randomUsername = dataGenerator.getRandomUsername()
      Given path "users"
     """ {
      "user":{
            "email": "#(randomEmail)",
            "password":"#(userData.password)",
            "username":"#(randomUsername)"
              }
      }
     """

#      And request {"user":{"email": "#(userData.email)","password":"#(userData.password)","username":"#(userData.username)"}}
      When method Post
      Then status 200


