
class ReserveSeatModel {
  ReserveSeatModel({
    required this.deckCode,
    required this.seatNumber,
  });
  late  String deckCode;
  late  String seatNumber;



  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['deckCode'] = deckCode;
    _data['seatNumber'] = seatNumber;
    return _data;
  }
}