class ProductsResponse {
  bool? _success;
  int? _code;
  String? _reason;
  List<Product>? _data;
  dynamic _errors;

  bool? get success => _success;

  int? get code => _code;

  String? get reason => _reason;

  List<Product>? get data => _data;

  dynamic get errors => _errors;

  ProductsResponse({
    bool? success,
    int? code,
    String? reason,
    List<Product>? data,
    dynamic errors,
  }) {
    _success = success;
    _code = code;
    _reason = reason;
    _data = data;
    _errors = errors;
  }

  ProductsResponse.fromJson(dynamic json) {
    _success = json['success'];
    _code = json['code'];
    _reason = json['reason'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Product.fromJson(v));
      });
    }
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
    map['errors'] = _errors;
    return map;
  }
}

class Product {
  String? _mxikCode;
  String? _groupName;
  String? _className;
  String? _positionName;
  String? _subPositionName;
  String? _brandName;
  String? _attributeName;
  int? _unitCode;
  String? _unitName;
  int? _commonUnitCode;
  String? _commonUnitName;
  List<Units>? _units;
  int? _myProduct;

  String? get mxikCode => _mxikCode;

  String? get groupName => _groupName;

  String? get className => _className;

  String? get positionName => _positionName;

  String? get subPositionName => _subPositionName;

  String? get brandName => _brandName;

  String? get attributeName => _attributeName;

  int? get unitCode => _unitCode;

  String? get unitName => _unitName;

  int? get commonUnitCode => _commonUnitCode;

  String? get commonUnitName => _commonUnitName;

  List<Units>? get units => _units;

  int? get myProduct => _myProduct;

  Product({
    String? mxikCode,
    String? groupName,
    String? className,
    String? positionName,
    String? subPositionName,
    String? brandName,
    String? attributeName,
    int? unitCode,
    String? unitName,
    int? commonUnitCode,
    String? commonUnitName,
    List<Units>? units,
    int? myProduct,
  }) {
    _mxikCode = mxikCode;
    _groupName = groupName;
    _className = className;
    _positionName = positionName;
    _subPositionName = subPositionName;
    _brandName = brandName;
    _attributeName = attributeName;
    _unitCode = unitCode;
    _unitName = unitName;
    _commonUnitCode = commonUnitCode;
    _commonUnitName = commonUnitName;
    _units = units;
    _myProduct = myProduct;
  }

  Product.fromJson(dynamic json) {
    _mxikCode = json['mxikCode'];
    _groupName = json['groupName'];
    _className = json['className'];
    _positionName = json['positionName'];
    _subPositionName = json['subPositionName'];
    _brandName = json['brandName'];
    _attributeName = json['attributeName'];
    _unitCode = json['unitCode'];
    _unitName = json['unitName'];
    _commonUnitCode = json['commonUnitCode'];
    _commonUnitName = json['commonUnitName'];
    if (json['units'] != null) {
      _units = [];
      json['units'].forEach((v) {
        _units?.add(Units.fromJson(v));
      });
    }
    _myProduct = json['myProduct'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['mxikCode'] = _mxikCode;
    map['groupName'] = _groupName;
    map['className'] = _className;
    map['positionName'] = _positionName;
    map['subPositionName'] = _subPositionName;
    map['brandName'] = _brandName;
    map['attributeName'] = _attributeName;
    map['unitCode'] = _unitCode;
    map['unitName'] = _unitName;
    map['commonUnitCode'] = _commonUnitCode;
    map['commonUnitName'] = _commonUnitName;
    if (_units != null) {
      map['units'] = _units?.map((v) => v.toJson()).toList();
    }
    map['myProduct'] = _myProduct;
    return map;
  }
}

class Units {
  int? _id;
  String? _name;
  String? _nameUz;
  String? _nameRu;
  dynamic _nameEng;
  dynamic _nameLatin;
  String? _unit;
  int? _commonUnitsId;
  String? _difference;
  String? _description;

  int? get id => _id;

  String? get name => _name;

  String? get nameUz => _nameUz;

  String? get nameRu => _nameRu;

  dynamic get nameEng => _nameEng;

  dynamic get nameLatin => _nameLatin;

  String? get unit => _unit;

  int? get commonUnitsId => _commonUnitsId;

  String? get difference => _difference;

  String? get description => _description;

  Units({
    int? id,
    String? name,
    String? nameUz,
    String? nameRu,
    dynamic nameEng,
    dynamic nameLatin,
    String? unit,
    int? commonUnitsId,
    String? difference,
    String? description,
  }) {
    _id = id;
    _name = name;
    _nameUz = nameUz;
    _nameRu = nameRu;
    _nameEng = nameEng;
    _nameLatin = nameLatin;
    _unit = unit;
    _commonUnitsId = commonUnitsId;
    _difference = difference;
    _description = description;
  }

  Units.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _nameUz = json['nameUz'];
    _nameRu = json['nameRu'];
    _nameEng = json['nameEng'];
    _nameLatin = json['nameLatin'];
    _unit = json['unit'];
    _commonUnitsId = json['commonUnitsId'];
    _difference = json['difference'];
    _description = json['description'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['nameUz'] = _nameUz;
    map['nameRu'] = _nameRu;
    map['nameEng'] = _nameEng;
    map['nameLatin'] = _nameLatin;
    map['unit'] = _unit;
    map['commonUnitsId'] = _commonUnitsId;
    map['difference'] = _difference;
    map['description'] = _description;
    return map;
  }
}
