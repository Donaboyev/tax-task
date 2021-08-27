class RegisterRequest {
  String? _certificateId;
  String? _orgTin;
  String? _signData;
  int? _viaDirectorKey;

  String? get certificateId => _certificateId;
  String? get orgTin => _orgTin;
  String? get signData => _signData;
  int? get viaDirectorKey => _viaDirectorKey;

  RegisterRequest({
    String? certificateId,
    String? orgTin,
    String? signData,
    int? viaDirectorKey,
  }) {
    _certificateId = certificateId;
    _orgTin = orgTin;
    _signData = signData;
    _viaDirectorKey = viaDirectorKey;
  }

  RegisterRequest.fromJson(dynamic json) {
    _certificateId = json['certificateId'];
    _orgTin = json['orgTin'];
    _signData = json['signData'];
    _viaDirectorKey = json['viaDirectorKey'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['certificateId'] = _certificateId;
    map['orgTin'] = _orgTin;
    map['signData'] = _signData;
    map['viaDirectorKey'] = _viaDirectorKey;
    return map;
  }
}
