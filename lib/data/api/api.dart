///Live Server
// const String _baseUrl = 'https://testcore.yourcampus.xyz/api/v2';
///Test Server
const String _baseUrl = 'https://abc.com';

class Api {
  Api._();

  // Token
  static Uri updateAccessToken() {
    return Uri.parse('$_baseUrl/user/refresh-token/');
  }

  //login
  static Uri userLogin() {
    return Uri.parse('$_baseUrl/user/login/');
  }

  ///Dashboard
  static Uri getDashboardProductsCategory() {
    return Uri.parse('$_baseUrl/products_category/');
  }
}
