abstract class BaseRepository {
  Future<String> getErrorMessage(String message) async {
    String errorMessage = '';
    switch (message) {
      case "Connection timeout":
        errorMessage = 'Время соединения вышло';
        break;
      case "Something wrong":
        errorMessage =
            'Что-то не так. Проверьте свое интернет-соединение, несмотря ни на что.';
        break;
      default:
        errorMessage = message;
        break;
    }
    return errorMessage;
  }
}
