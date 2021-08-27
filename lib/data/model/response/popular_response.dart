class PopularResponse {
  bool? _success;
  int? _code;
  String? _reason;
  List<PopularProduct>? _data;
  dynamic _errors;

  bool? get success => _success;

  int? get code => _code;

  String? get reason => _reason;

  List<PopularProduct>? get data => _data;

  dynamic get errors => _errors;

  PopularResponse({
    bool? success,
    int? code,
    String? reason,
    List<PopularProduct>? data,
    dynamic errors,
  }) {
    _success = success;
    _code = code;
    _reason = reason;
    _data = data;
    _errors = errors;
  }

  PopularResponse.fromJson(dynamic json) {
    _success = json['success'];
    _code = json['code'];
    _reason = json['reason'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(PopularProduct.fromJson(v));
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

class PopularProduct {
  String? _mxikCode;
  String? _groupName;
  String? _className;
  String? _positionName;
  String? _subPositionName;
  dynamic _brandName;
  dynamic _attributeName;
  int? _unitCode;
  String? _unitName;
  dynamic _commonUnitCode;
  dynamic _commonUnitName;
  dynamic _units;
  int? _myProduct;

  String? get mxikCode => _mxikCode;

  String? get groupName => _groupName;

  String? get className => _className;

  String? get positionName => _positionName;

  String? get subPositionName => _subPositionName;

  dynamic get brandName => _brandName;

  dynamic get attributeName => _attributeName;

  int? get unitCode => _unitCode;

  String? get unitName => _unitName;

  dynamic get commonUnitCode => _commonUnitCode;

  dynamic get commonUnitName => _commonUnitName;

  dynamic get units => _units;

  int? get myProduct => _myProduct;

  PopularProduct({
    String? mxikCode,
    String? groupName,
    String? className,
    String? positionName,
    String? subPositionName,
    dynamic brandName,
    dynamic attributeName,
    int? unitCode,
    String? unitName,
    dynamic commonUnitCode,
    dynamic commonUnitName,
    dynamic units,
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

  PopularProduct.fromJson(dynamic json) {
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
    _units = json['units'];
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
    map['units'] = _units;
    map['myProduct'] = _myProduct;
    return map;
  }
}
