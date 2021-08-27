class CategoriesResponse {
  bool? _success;
  dynamic _code;
  dynamic _reason;
  List<Category>? _data;
  int? _recordTotal;
  dynamic _errors;

  bool? get success => _success;
  dynamic get code => _code;
  dynamic get reason => _reason;
  List<Category>? get data => _data;
  int? get recordTotal => _recordTotal;
  dynamic get errors => _errors;

  CategoriesResponse({
    bool? success,
    dynamic code,
    dynamic reason,
    List<Category>? data,
    int? recordTotal,
    dynamic errors,
  }) {
    _success = success;
    _code = code;
    _reason = reason;
    _data = data;
    _recordTotal = recordTotal;
    _errors = errors;
  }

  CategoriesResponse.fromJson(dynamic json) {
    _success = json['success'];
    _code = json['code'];
    _reason = json['reason'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Category.fromJson(v));
      });
    }
    _recordTotal = json['recordTotal'];
    _errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['success'] = _success;
    map['code'] = _code;
    map['reason'] = _reason;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    map['recordTotal'] = _recordTotal;
    map['errors'] = _errors;
    return map;
  }
}

class Category {
  String? _code;
  String? _name;
  String? _nameUz;
  String? _nameRu;
  String? _nameEng;
  dynamic _description;
  int? _mxikCount;
  String? _logoSvg;
  String? _createdAt;
  dynamic _updatedAt;

  String? get code => _code;
  String? get name => _name;
  String? get nameUz => _nameUz;
  String? get nameRu => _nameRu;
  String? get nameEng => _nameEng;
  dynamic get description => _description;
  int? get mxikCount => _mxikCount;
  String? get logoSvg => _logoSvg;
  String? get createdAt => _createdAt;
  dynamic get updatedAt => _updatedAt;

  Category({
    String? code,
    String? name,
    String? nameUz,
    String? nameRu,
    String? nameEng,
    dynamic description,
    int? mxikCount,
    String? logoSvg,
    String? createdAt,
    dynamic updatedAt,
  }) {
    _code = code;
    _name = name;
    _nameUz = nameUz;
    _nameRu = nameRu;
    _nameEng = nameEng;
    _description = description;
    _mxikCount = mxikCount;
    _logoSvg = logoSvg;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  Category.fromJson(dynamic json) {
    _code = json['code'];
    _name = json['name'];
    _nameUz = json['nameUz'];
    _nameRu = json['nameRu'];
    _nameEng = json['nameEng'];
    _description = json['description'];
    _mxikCount = json['mxikCount'];
    _logoSvg = json['logoSvg'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['code'] = _code;
    map['name'] = _name;
    map['nameUz'] = _nameUz;
    map['nameRu'] = _nameRu;
    map['nameEng'] = _nameEng;
    map['description'] = _description;
    map['mxikCount'] = _mxikCount;
    map['logoSvg'] = _logoSvg;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }
}
