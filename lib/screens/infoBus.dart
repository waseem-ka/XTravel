import 'package:bookingbus/models/Trips.dart';
import 'package:bookingbus/screens/stations.dart';
import 'package:flutter/material.dart';
import 'package:bookingbus/models/buses.dart';
import 'package:bookingbus/api_url.dart';
import 'package:bookingbus/api/api_provider.dart';
import 'login.dart';

class infoBus extends StatefulWidget {
  final Bus buses;
  final Map costomer_info;

  const infoBus({super.key, required this.buses, required this.costomer_info});

  @override
  _infoBusState createState() => _infoBusState();
}

Map station = {};

class _infoBusState extends State<infoBus> {
  String message = '';
  static String tokenHeader = Token_Info["token"];
  final _locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    DateTime time = DateTime.parse(widget.buses.date);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Bus App"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Hero(
                  tag: widget.buses.id,
                  child: Container(
                    width: double.infinity,
                    height: 450.0,
                    decoration: const BoxDecoration(
                      color: const Color.fromARGB(255, 125, 131, 123),
                      image: DecorationImage(
                        image: AssetImage('assets/images/Damascus.png'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 400.0,
              width: double.infinity,
              transform: Matrix4.translationValues(0.0, -40.0, 0.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40.0),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 25.0, vertical: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${widget.buses.destination}, ${widget.buses.id}',
                      style: const TextStyle(
                        fontSize: 28.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Row(
                      children: <Widget>[
                        const Icon(
                          Icons.event_available,
                          size: 60.0,
                          color: Colors.black,
                        ),
                        const SizedBox(width: 15.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Start on : ${time.month}/${time.day}: ${time.hour}:${time.minute} O'clock",
                              style: const TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const Text(
                              'Duration: 1.5 hours',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(20.0),
        height: 130.0,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.buses.avalable_sets,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'Sets Found',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                    horizontal: 50.0, vertical: 20.0),
                backgroundColor: const Color(0xFFDFF1FF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              child: const Text(
                'Get Set',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () async {
                print(widget.costomer_info);
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => Stations(
                            busId: widget.buses.id,
                            ticketNumber:
                                widget.costomer_info["trip_availabel"],
                          )),
                );
                // print("station: $station");
                // List locatio = station["Locations"];
                // print("location: $locatio");
                // showDialog(
                //     context: context,
                //     builder: (BuildContext context) {
                //       return AlertDialog(
                //         title: const Text('Get Set'),
                //         content: Text(
                //             'You Have Just ${widget.costomer_info["trip_availabel"]} Ticket.'),
                //         actions: [
                //           ElevatedButton(
                //             style: ElevatedButton.styleFrom(
                //                 backgroundColor: Colors.green),
                //             onPressed: () {
                //               Navigator.pop(context);
                //             },
                //             child: const Text('Choose from archives'),
                //           ),
                //           ElevatedButton(
                //               style: ElevatedButton.styleFrom(
                //                   backgroundColor: Colors.indigo),
                //               onPressed: () {
                //                 Navigator.push(
                //                     context,
                //                     MaterialPageRoute(
                //                         builder: (context) => const map()));
                //                 // Write code to delete item
                //               },
                //               child: const Text(
                //                 'Confirm',
                //               )),
                //         ],
                //       );
                //     });
                // // showDialog(
                // //     context: context,
                // //     builder: (context) =>
                // //         AlertDialog(
                // //           title: const Text("Get Set"),
                // //           actions: <Widget>[
                // //             Padding(
                // //               padding:
                // //               const EdgeInsets.symmetric(horizontal: 25.0),
                // //               child: Container(
                // //                 decoration: BoxDecoration(
                // //                   color: Colors.grey[200],
                // //                   border: Border.all(color: Colors.white),
                // //                   borderRadius: BorderRadius.circular(12),
                // //                 ),
                // //                 child: Padding(
                // //                   padding: const EdgeInsets.only(left: 20.0),
                // //                   child: InkWell(
                // //                       onTap: () {
                // //                         Navigator.push(
                // //                             context,
                // //                             MaterialPageRoute(
                // //                                 builder: (context) => map()));
                // //                       },
                // //                       child: Padding(
                // //                           padding:
                // //                           const EdgeInsets.only(left: 20.0),
                // //                           child:
                // //                           Text(' station${tokenHeader}'))),
                // //                 ),
                // //               ),
                // //             ),
                // //             Padding(
                // //               padding:
                // //               const EdgeInsets.symmetric(horizontal: 25.0),
                // //               child: Container(
                // //                 decoration: BoxDecoration(
                // //                   color: Colors.grey[200],
                // //                   border: Border.all(color: Colors.white),
                // //                   borderRadius: BorderRadius.circular(12),
                // //                 ),
                // //                 child: Padding(
                // //                     padding: const EdgeInsets.only(left: 20.0),
                // //                     child: Text(
                // //                         'You Have Just ${widget
                // //                             .costomer_info["trip_availabel"]} Ticket Right now')),
                // //               ),
                // //             ),
                // //             //${widget.buses.destination}
                // //             TextButton(
                // //               onPressed: () async {
                // //                 Map<String, dynamic> data = {
                // //                   "trip_id": widget.buses.id.toString(),
                // //                   "go_from": _locationController.text,
                // //                   "trip_availabel":
                // //                   widget.costomer_info["trip_availabel"],
                // //                 };
                // //                 APIProvider().post(APIUrl.resrvation, data);
                // //                 Navigator.of(context).pop();
                // //               },
                // //               child: Container(
                // //                 padding: const EdgeInsets.all(14),
                // //                 child: const Text(
                // //                   "Get Set",
                // //                 ),
                // //               ),
                // //             ),
                // //           ],
                // //         ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
