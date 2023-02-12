import 'package:bookingbus/api/api_provider.dart';
import 'package:bookingbus/api/local_storage_provider.dart';
import 'package:bookingbus/screens/login.dart';
import 'package:bookingbus/screens/switcher.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageProvider.initalize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.green, backgroundColor: Color(-6907493)),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    APIProvider.setToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);

    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.green, //223.315
          primaryColor: Colors.green[522]),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: APIProvider.hasToken ? const Switcher() : const Login(),
      ),
    );
  }
}
