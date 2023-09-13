function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev';
  }



  var config = {
    apiUrl:'https://conduit.productionready.io/api/'
  }




  if (env == 'dev') {
    config.userEmail = 'search4vivek007@gmail.com'
    config.userPassword = 'vidady123'
  } else if (env == 'qa') {
    // customize
    config.userEmail = 'search4vivek007@gmail.com'
    config.userPassword = 'vidady123'
  }


  var accessToken = karate.callSingle('classpath:helpers/CreateToken.feature',config).authToken
  karate.configure('headers',{Authorization: 'Token '+accessToken})


  return config;
}