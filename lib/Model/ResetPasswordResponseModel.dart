class ResetPasswordResponseModel {
  ResetPasswordResponseModel({
    required this.verificationId,
  });
  late final String verificationId;

  ResetPasswordResponseModel.fromJson(Map<String, dynamic> json){
    verificationId = json['verificationId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['verificationId'] = verificationId;
    return _data;
  }
}