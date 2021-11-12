class FerrylistModel {
  FerrylistModel({
    required this.resultType,
    required this.tickets,
  });
  late final int resultType;
  late final List<Tickets> tickets;

  FerrylistModel.fromJson(Map<String, dynamic> json){
    resultType = json['resultType'];
    tickets = List.from(json['tickets']).map((e)=>Tickets.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['resultType'] = resultType;
    _data['tickets'] = tickets.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Tickets {
  Tickets({
    required this.ferryCode,
    required this.tripNumber,
    required this.routeCode,
    required this.routeName,
    required this.startStationCode,
    required this.endStationCode,
    required this.startStationName,
    required this.endStationName,
    required this.startTime,
    this.bookingTime,
    required this.endTime,
    required this.ferryType,
    required this.assetName,
    required this.assetNumber,
    required this.deckes,
    required this.products,
  });
  late final int ferryCode;
  late final String tripNumber;
  late final String routeCode;
  late final String routeName;
  late final String startStationCode;
  late final String endStationCode;
  late final String startStationName;
  late final String endStationName;
  late final String startTime;
  late final Null bookingTime;
  late final String endTime;
  late final String ferryType;
  late final String assetName;
  late final String assetNumber;
  late final List<Deckes> deckes;
  late final List<Products> products;

  Tickets.fromJson(Map<String, dynamic> json){
    ferryCode = json['ferryCode'];
    tripNumber = json['tripNumber'];
    routeCode = json['routeCode'];
    routeName = json['routeName'];
    startStationCode = json['startStationCode'];
    endStationCode = json['endStationCode'];
    startStationName = json['startStationName'];
    endStationName = json['endStationName'];
    startTime = json['startTime'];
    bookingTime = null;
    endTime = json['endTime'];
    ferryType = json['ferryType'];
    assetName = json['assetName'];
    assetNumber = json['assetNumber'];
    deckes = List.from(json['deckes']).map((e)=>Deckes.fromJson(e)).toList();
    products = List.from(json['products']).map((e)=>Products.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ferryCode'] = ferryCode;
    _data['tripNumber'] = tripNumber;
    _data['routeCode'] = routeCode;
    _data['routeName'] = routeName;
    _data['startStationCode'] = startStationCode;
    _data['endStationCode'] = endStationCode;
    _data['startStationName'] = startStationName;
    _data['endStationName'] = endStationName;
    _data['startTime'] = startTime;
    _data['bookingTime'] = bookingTime;
    _data['endTime'] = endTime;
    _data['ferryType'] = ferryType;
    _data['assetName'] = assetName;
    _data['assetNumber'] = assetNumber;
    _data['deckes'] = deckes.map((e)=>e.toJson()).toList();
    _data['products'] = products.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Deckes {
  Deckes({
    required this.name,
    required this.code,
    required this.type,
    this.shape,
    required this.seatPrice,
    required this.seatCount,
    required this.seats,
  });
  late final String name;
  late final String code;
  late final String type;
  late final Null shape;
  late final String seatPrice;
  late final int seatCount;
  late final List<Seats> seats;

  Deckes.fromJson(Map<String, dynamic> json){
    name = json['name'];
    code = json['code'];
    type = json['type'];
    shape = null;
    seatPrice = json['seatPrice'];
    seatCount = json['seatCount'];
    seats = List.from(json['seats']).map((e)=>Seats.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['code'] = code;
    _data['type'] = type;
    _data['shape'] = shape;
    _data['seatPrice'] = seatPrice;
    _data['seatCount'] = seatCount;
    _data['seats'] = seats.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Seats {
  Seats({
    required this.code,
    required this.status,
  });
  late final String code;
  late final String status;

  Seats.fromJson(Map<String, dynamic> json){
    code = json['code'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['status'] = status;
    return _data;
  }
}

class Products {
  Products({
    required this.label,
    required this.code,
    this.type,
    this.discount,
    required this.price,
  });
  late final String label;
  late final String code;
  late final Null type;
  late final Null discount;
  late final List<Price> price;

  Products.fromJson(Map<String, dynamic> json){
    label = json['label'];
    code = json['code'];
    type = null;
    discount = null;
    price = List.from(json['price']).map((e)=>Price.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['label'] = label;
    _data['code'] = code;
    _data['type'] = type;
    _data['discount'] = discount;
    _data['price'] = price.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Price {
  Price({
    required this.deckType,
    required this.price,
  });

  late final String deckType;
  late final String price;

  Price.fromJson(Map<String, dynamic> json){
    deckType = json['deckType'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['deckType'] = deckType;
    _data['price'] = price;
    return _data;
  }

}