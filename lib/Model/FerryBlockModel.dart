class FerryBlockModel {
  FerryBlockModel({
    required this.resultType,
    required this.bookingId,
    required this.numberOfSeats,
  });
  late final int resultType;
  late final String bookingId;
  late final int numberOfSeats;

  FerryBlockModel.fromJson(Map<String, dynamic> json){
    resultType = json['resultType'];
    bookingId = json['bookingId'];
    numberOfSeats = json['numberOfSeats'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['resultType'] = resultType;
    _data['bookingId'] = bookingId;
    _data['numberOfSeats'] = numberOfSeats;
    return _data;
  }
}
