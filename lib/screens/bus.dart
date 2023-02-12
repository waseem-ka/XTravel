import 'package:bookingbus/api/api_provider.dart';
import 'package:bookingbus/screens/infoBus.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bookingbus/screens/login.dart';
import 'package:bookingbus/models/buses.dart';

class bus extends StatefulWidget {
  const bus({Key? key}) : super(key: key);

  @override
  _busState createState() => _busState();
}

class _busState extends State<bus> {
  void getTrips() async {
    Map data = await APIProvider().refresh();
    await Future.delayed(const Duration(milliseconds: 500));
    if (data['isSuccess'] ?? false) {
      setState(() {
        Token_Info = data;
      });
    }
  }

  Column _buildBuses() {
    List<Widget> allBuses = [];
    Token_Info["trips"].forEach((eachBus) {
      DateTime time = DateTime.parse(eachBus["date"]);

      allBuses.add(
        SizedBox(
          height: 80.0,
          child: Center(
            child: ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => infoBus(
                      buses: Bus.fromJson(eachBus),
                      costomer_info: Token_Info["customer"],
                    ),
                  ),
                );
              },
              leading: Hero(
                  tag: eachBus["trip_id"],
                  child: Image.asset("assets/images/Damascus.png")),
              title: Text(
                'Date:${time.month}/${time.day} ${time.hour}:${time.minute}',
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle: Text(
                '${eachBus["availabel_sets"]} Sets',
                style: const TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              trailing: Container(
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: const Color(0xFFFAF6F1),
                ),
                child: const Icon(
                  Icons.arrow_forward,
                  size: 25.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      );
    });
    return Column(children: allBuses);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        transitionBuilder: (
            Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Center(
                child: Text("Home Page"),
              ),
            ),
            body: Builder(
              builder: (context) {
                var fun= getTrips();
                if (Token_Info["trips"] == null) {
                  getTrips();
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (Token_Info["trips"].isEmpty) {
                  return const Center(
                    child: Text(
                      'No Trips',
                    ),
                  );
                }
                return RefreshIndicator(
                  onRefresh: () async {
                    setState(() {
                      Token_Info["trips"] = null;
                    });
                  },
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 0.0),
                    children: <Widget>[
                      const SizedBox(height: 30.0),
                      Text('Trips:',
                          style: GoogleFonts.bebasNeue(
                              fontSize: 20, color: Colors.green)),
                      const Divider(
                        height: 2,
                        color: Colors.indigo,
                      ),
                      _buildBuses(),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
