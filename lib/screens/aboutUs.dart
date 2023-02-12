import 'package:flutter/material.dart';

class AboutUsPage extends StatefulWidget {
  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[320],
      appBar: AppBar(
        title: const Text("About Us"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Image.asset("assets/images/company_logo.png"),
              Divider(height: 30,color: Colors.indigo,),

              const SizedBox(height: 16),
              const Text(
                  "Our company was founded in 2020 with the goal of providing high-quality products and services to our customers. We pride ourselves on our commitment to excellence and strive to exceed expectations in everything we do. Our team is made up of dedicated professionals who are passionate about what they do and are committed to achieving the best possible results for our clients. We look forward to working with you and helping you achieve your goals."),
              const SizedBox(height: 16),
              Divider(height: 1,color: Colors.indigo,),
              const Text("Contact Us",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text("Email: info@ourcompany.com"),
              const Text("Phone: 555-555-5555"),
              const Text("Address: 123 Main St, Anytown USA 12345"),
              Divider(height: 20,color: Colors.indigo,),
              const Text("Powerd by:"),

              const Text("Dr.Tarek Barhum"),

              const Text("Eng.Muhammad Almasri"),

              const Text("Eng.Waseem Kaskas"),

              const Text("Eng.Yaser Alsamsam"),

              const Text("Eng.Moaz Tello"),

              const Text("Eng.Ahmad Obaid"),

              const Text("Eng.Massa Alzaid"),
              Divider(height: 30,color: Colors.indigo,),


            ],
          ),
        ),
      ),
    );
  }
}
