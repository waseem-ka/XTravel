import 'package:flutter/material.dart';

class ComplaintsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complaints"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            children: <Widget>[
              Image.asset("assets/images/company_logo.png"),
              SizedBox(height: 16),
              Text("We are sorry that you are not satisfied with our service. Your feedback is very important to us. Please use this form to submit your complaints and we will do our best to resolve your issue as soon as possible."),
              SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(labelText: "Name"),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Email"),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Phone"),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: "Complaint"),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                child: Text("Submit"),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
