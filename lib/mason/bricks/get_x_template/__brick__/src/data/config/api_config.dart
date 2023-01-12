const bool isProduction = true;
const String _developmentUrl = 'http://localhost:3308';
const String _productionUrl = 'http://localhost:3308';
const String baseUrl = isProduction ? _productionUrl : _developmentUrl;
const String apiUrl = '$_productionUrl/v1';
const String signInUrl = '$apiUrl/signin';
const String signUpUrl = '$apiUrl/signup';
const String refreshSessionUrl = '$apiUrl/session/refresh';

