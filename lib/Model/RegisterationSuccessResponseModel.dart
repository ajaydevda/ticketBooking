class RegisterationSuccessResponseModel {
  RegisterationSuccessResponseModel({
    required this.verificationId,
  });
  late final String verificationId;

  RegisterationSuccessResponseModel.fromJson(Map<String, dynamic> json){
    verificationId = json['verificationId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['verificationId'] = verificationId;
    return _data;
  }
}