class AppConstants {
  static const BASE_URL = 'https://api-tasnif.soliq.uz/cl-api/';
  static const SIGN_DATA = 'E_IMZO';
  static const LANG_UZ_CYRL = 'uz_cyrl';
  static const CATEGORY_SIZE = 12;
  static const VERSION = String.fromEnvironment('VERSION');
  static const Version RUNNING =
  VERSION == 'lazy' ? Version.LAZY : Version.WAIT;
}

enum Version {
  LAZY,
  WAIT,
}
