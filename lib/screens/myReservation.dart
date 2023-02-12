import 'package:flutter/material.dart';
import 'package:bookingbus/screens/settings.dart';

class MyReservationsPage extends StatefulWidget {
  @override
  _MyReservationsPageState createState() => _MyReservationsPageState();
}

class _MyReservationsPageState extends State<MyReservationsPage> {
  List<Map<String, dynamic>> reservations =
      List<Map<String, dynamic>>.from(ReservaionToken["trips"]);

  @override
  Widget build(BuildContext context) {
    print("List: $reservations");

    return Scaffold(
      appBar: AppBar(
        title: Text("My Reservations"),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: reservations.length,
          itemBuilder: (BuildContext context, int index) {
            DateTime date = DateTime.parse(reservations[index]["date"]);
            return Card(
              child: ListTile(
                leading: Image.asset("assets/images/bus.png"),
                //const Icon(Icons.bus_alert_rounded , color: Colors.green),
                title: Text(reservations[index]["destination"]),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "date: ${date.day}/${date.month}/${date.year}",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("At : ${date.hour}:${date.minute}"),
                  ],
                ),
                trailing: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                        "Are you sure that you want to delete this trip",
                        style: TextStyle(fontSize: 15),
                      ),
                      actions: <Widget>[
                        Row(
                          children: <Widget>[
                            TextButton(
                              onPressed: () {},
                              child: Text("Yes"),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text("Cancle"))
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
