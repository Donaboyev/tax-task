class RegisterResponse {
  bool? _success;
  int? _code;
  String? _text;
  Token? _token;
  dynamic _errors;

  bool? get success => _success;
  int? get code => _code;
  String? get text => _text;
  Token? get token => _token;
  dynamic get errors => _errors;

  RegisterResponse({
    bool? success,
    int? code,
    String? text,
    Token? data,
    dynamic errors,
  }) {
    _success = success;
    _code = code;
    _text = text;
    _token = data;
    _errors = errors;
  }

  RegisterResponse.fromJson(dynamic json) {
    _success = json['success'];
    _code = json['code'];
    _text = json['text'];
    _token = json['data'] != null ? Token.fromJson(json['data']) : null;
    _errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['success'] = _success;
    map['code'] = _code;
    map['text'] = _text;
    if (_token != null) {
      map['data'] = _token?.toJson();
    }
    map['errors'] = _errors;
    return map;
  }
}

class Token {
  String? _jwtToken;

  String? get jwtToken => _jwtToken;

  Token({String? jwtToken}) {
    _jwtToken = jwtToken;
  }

  Token.fromJson(dynamic json) {
    _jwtToken = json['jwtToken'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['jwtToken'] = _jwtToken;
    return map;
  }
}
