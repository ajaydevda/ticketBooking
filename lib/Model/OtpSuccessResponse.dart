class OtpSuccessResponse {
  OtpSuccessResponse({
    required this.jwt,
    required this.customerId,
  });
  late final String jwt;
  late final int customerId;

  OtpSuccessResponse.fromJson(Map<String, dynamic> json){
    jwt = json['jwt'];
    customerId = json['customerId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['jwt'] = jwt;
    _data['customerId'] = customerId;
    return _data;
  }
}