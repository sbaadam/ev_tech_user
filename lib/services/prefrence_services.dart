import 'package:shared_preferences/shared_preferences.dart';

class GlobalVariables {
  static String? authToken;
  static String? role;

  /// ====== TOKEN ======
  static Future<void> setToken(String token) async {
    authToken = token;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('auth_token', token);
  }

  static Future<void> loadToken() async {
    final prefs = await SharedPreferences.getInstance();
    authToken = prefs.getString('auth_token');
    // authToken = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiOGFjNDg4MjZiOTEzZWQzMTNhYmExZTVhMWY2ZTBmMzI5MWY0MTgyNGU4YTMxMWNlNTA3Mzk1ZmNjNWM2Y2FkNWM3ZTBmZjVlMWM4NjgxYWUiLCJpYXQiOjE3NTUwNjYxOTUuMDA4NjA3LCJuYmYiOjE3NTUwNjYxOTUuMDA4NjA5LCJleHAiOjE3ODY2MDIxOTUuMDAyNDAzLCJzdWIiOiI4Iiwic2NvcGVzIjpbXX0.eeeNkI0L4_IMQZPrONLHzhLIGv7zx6RsBzZJgQJmdds4jQkonvLRiKKO2bKw7VCzD49HP-SZTy6zW85H7rT6ZKw_UWy7zVBgiYKK9NLEbxqhIzn3NYMEhjZ6NSDwOV1o9n4QJsHM2f6J9X7QVCGPTAmTcrnDSsrfVR0EEVXScjZU2h_QWHFB6AF-kwKLlzX9svmA43x0Hkli_VW5kChCvl8W8dxZEjekaetpHYbyoPs7VFPcF3pX5Z115fldVd1QXP-uJD3SmtTOFoYHYYrDX07zUgl1XJFH_5Gc_TV8ZkJwoRMf0b1ThhnE0C6AWJ4rlrgTq8NkOKua798ehDGohcmmlXU2I-icWh4DoAog9M-hzexg6lvOuX8qL78SYILaVHS9a9B0J4ytd9jUBWzugY36I8jBYqGy6GRi7Ovl2J1lvdzjju3Fdz8Xz2rn0igYGRZbumvRaY7qIE-wwGfJFA7VYyXo0u2XELW6zdr5g1xPDxthBBg5HigpoO9cP4Xh5_tSy03szxKhtuUdpSO3TCdR5oKox2Lav5KKZ_K-F-MY5zCr6ZOiQYd7ZYCPSrvda3bjt_YhRWbNfOb0mHKO_W8wfcMkKxt73X8ijqU3laBbVTd8zzLL-Rk8NQAqDNapgYyiSkZ0NGB3Nd-Ac7BXUQ2z1b0rQKE5BMVldLmi9R8';
  }

  static Future<void> clearToken() async {
    authToken = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
  }

  /// ====== Role ======
  static Future<void> setRole(String id) async {
    role = id;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('role', id);
  }

  static Future<void> loadRole() async {
    final prefs = await SharedPreferences.getInstance();
    role = prefs.getString('role');
  }
  static Future<void> clearAll() async {
    authToken = null;
    role = null;

    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
