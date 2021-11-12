class SourceDestinationModel {
  SourceDestinationModel({
    required this.ferryTypes,
    required this.ferryStops,
    required this.ferryZones,
  });
  late final List<FerryTypes> ferryTypes;
  late final List<FerryStops> ferryStops;
  late final List<FerryZones> ferryZones;

  SourceDestinationModel.fromJson(Map<String, dynamic> json){
    ferryTypes = List.from(json['ferryTypes']).map((e)=>FerryTypes.fromJson(e)).toList();
    ferryStops = List.from(json['ferryStops']).map((e)=>FerryStops.fromJson(e)).toList();
    ferryZones = List.from(json['ferryZones']).map((e)=>FerryZones.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ferryTypes'] = ferryTypes.map((e)=>e.toJson()).toList();
    _data['ferryStops'] = ferryStops.map((e)=>e.toJson()).toList();
    _data['ferryZones'] = ferryZones.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class FerryTypes {
  FerryTypes({
    required this.name,
    this.description,
    required this.code,
  });
  late final String name;
  late final Null description;
  late final String code;

  FerryTypes.fromJson(Map<String, dynamic> json){
    name = json['name'];
    description = null;
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['description'] = description;
    _data['code'] = code;
    return _data;
  }
}

class FerryStops {
  FerryStops({
    required this.name,
    required this.code,
    this.address,
    this.latitude,
    this.longitude,
    this.altitude,
    required this.id,
    required this.direction,
  });
  late final String name;
  late final String code;
  late final String? address;
  late final String? latitude;
  late final String? longitude;
  late final String? altitude;
  late final int id;
  late final int direction;

  FerryStops.fromJson(Map<String, dynamic> json){
    name = json['name'];
    code = json['code'];
    address = null;
    latitude = null;
    longitude = null;
    altitude = null;
    id = json['id'];
    direction = json['direction'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['code'] = code;
    _data['address'] = address;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    _data['altitude'] = altitude;
    _data['id'] = id;
    _data['direction'] = direction;
    return _data;
  }


}

class FerryZones {
  FerryZones({
    required this.name,
    this.description,
    required this.code,
    required this.ferryRoutes,
  });
  late final String name;
  late final String? description;
  late final String code;
  late final List<FerryRoutes> ferryRoutes;

  FerryZones.fromJson(Map<String, dynamic> json){
    name = json['name'];
    description = null;
    code = json['code'];
    ferryRoutes = List.from(json['ferryRoutes']).map((e)=>FerryRoutes.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['description'] = description;
    _data['code'] = code;
    _data['ferryRoutes'] = ferryRoutes.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class FerryRoutes {
  FerryRoutes({
    required this.name,
    required this.description,
    required this.code,
    required this.zone,
    required this.stops,
  });
  late final String name;
  late final String description;
  late final String code;
  late final String zone;
  late final List<Stops> stops;

  FerryRoutes.fromJson(Map<String, dynamic> json){
    name = json['name'];
    description = json['description'];
    code = json['code'];
    zone = json['zone'];
    stops = List.from(json['stops']).map((e)=>Stops.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['description'] = description;
    _data['code'] = code;
    _data['zone'] = zone;
    _data['stops'] = stops.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Stops {
  Stops({
    required this.order,
    required this.direction,
    required this.stop,
  });
  late final int order;
  late final int direction;
  late final Stop stop;

  Stops.fromJson(Map<String, dynamic> json){
    order = json['order'];
    direction = json['direction'];
    stop = Stop.fromJson(json['stop']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['order'] = order;
    _data['direction'] = direction;
    _data['stop'] = stop.toJson();
    return _data;
  }
}

class Stop {
  Stop({
    required this.name,
    required this.code,
    this.address,
    this.latitude,
    this.longitude,
    this.altitude,
    required this.id,
    required this.direction,
  });
  late final String name;
  late final String code;
  late final String? address;
  late final String? latitude;
  late final String? longitude;
  late final String? altitude;
  late final int id;
  late final int direction;

  Stop.fromJson(Map<String, dynamic> json){
    name = json['name'];
    code = json['code'];
    address = null;
    latitude = null;
    longitude = null;
    altitude = null;
    id = json['id'];
    direction = json['direction'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['name'] = name;
    _data['code'] = code;
    _data['address'] = address;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    _data['altitude'] = altitude;
    _data['id'] = id;
    _data['direction'] = direction;
    return _data;
  }
}