Feature: Home Work

    Background: Precoditions
        * url apiUrl


    Scenario: Favourite articles
        * path 'articles'
        * params {limit:10, offset:0}
        * method Get
        * status 200
        * def slugCountOfFirst = get[0] response..slug
        * def favouriteCountOfFirst = get[0] response..favoritesCount
        * print slugCountOfFirst
        * print favouriteCountOfFirst
        * path 'articles/'+slugCountOfFirst+'/favorite'
        * method Post
        * def favouriteCountPostAccept = get[0] response..favoritesCount
        * print favouriteCountPostAccept
        * match get[0] response..favoritesCount == favouriteCountOfFirst + 1
        * path 'articles/'+slugCountOfFirst+'/favorite'
        * method delete
        * def favouriteCountPostDecline = get[0] response..favoritesCount
        * print favouriteCountPostDecline





