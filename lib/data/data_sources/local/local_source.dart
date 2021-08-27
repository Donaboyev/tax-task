import 'package:get_storage/get_storage.dart';

class LocalSource {
  var _localStorage = GetStorage();

  LocalSource._();

  static LocalSource? _instance;

  static LocalSource getInstance() {
    if (_instance != null) {
      return _instance!;
    } else
      return LocalSource._();
  }

  String getAccessToken() {
    return _localStorage.read<String>('access_token') ?? '';
  }

  Future<void> setAccessToken(String token) async {
    await _localStorage.write('access_token', token);
  }
}
