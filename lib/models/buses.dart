class Bus {
  final int id;
  final String startStation;
  final String avalable_sets;
  final String destination;
  final String date;

  Bus({
    required this.id,
    required this.startStation,
    required this.avalable_sets,
    required this.destination,
    required this.date,
  });

  Bus.fromJson(Map<String, dynamic> data)
      : id = data["trip_id"],
        startStation = data["start_station"],
        avalable_sets = data["availabel_sets"],
        destination = data["destination"],
        date = data["date"];

}
