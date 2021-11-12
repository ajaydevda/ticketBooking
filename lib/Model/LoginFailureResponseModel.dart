class FailureModel {
  FailureModel({
    required this.message,
    required this.validationErrors,
  });
  late final dynamic message;
  late final List<ValidationErrors> validationErrors;

  FailureModel.fromJson(Map<String, dynamic> json){
    message = json['message'];
    validationErrors =json['validationErrors']!=null? List.from(json['validationErrors']).map((e)=>ValidationErrors.fromJson(e)).toList():[];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['message'] = message;
    _data['validationErrors'] = validationErrors.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ValidationErrors {
  ValidationErrors({
    required this.value,
    required this.error,
  });
  late final String value;
  late final String error;

  ValidationErrors.fromJson(Map<String, dynamic> json){
    value = json['value'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['value'] = value;
    _data['error'] = error;
    return _data;
  }
}