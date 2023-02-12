class Location {
  int? id;
  String? LocationName;

  Location({
    required this.id,
    required this.LocationName,
  });

  Location.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        LocationName = data['go_from'];
}
