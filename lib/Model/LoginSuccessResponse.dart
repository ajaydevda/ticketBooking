class LoginSuccessResponse {
  LoginSuccessResponse({
    required this.customerId,
    required this.jwt,
    required this.firstName,
    required this.middleName,
    required this.lastName,
    required this.gender,
    required this.dateOfBirth,
    required this.email,
    required this.mobileNumber,
  });
  late final int customerId;
  late final String jwt;
  late final String firstName;
  late final String middleName;
  late final String lastName;
  late final int gender;
  late final String dateOfBirth;
  late final String email;
  late final String mobileNumber;

  LoginSuccessResponse.fromJson(Map<String, dynamic> json){
    customerId = json['customerId'];
    jwt = json['jwt'];
    firstName = json['firstName'];
    middleName = json['middleName'];
    lastName = json['lastName'];
    gender = json['gender'];
    dateOfBirth = json['dateOfBirth'];
    email = json['email'];
    mobileNumber = json['mobileNumber'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['customerId'] = customerId;
    _data['jwt'] = jwt;
    _data['firstName'] = firstName;
    _data['middleName'] = middleName;
    _data['lastName'] = lastName;
    _data['gender'] = gender;
    _data['dateOfBirth'] = dateOfBirth;
    _data['email'] = email;
    _data['mobileNumber'] = mobileNumber;
    return _data;
  }
}