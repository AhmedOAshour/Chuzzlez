import 'package:flutter/material.dart';
import 'package:chuzzlez/services/fire_store_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chuzzlez/providers/opening_provider.dart';
import 'package:provider/provider.dart';

// Define a custom Form widget.
class OpeningsForm extends StatefulWidget {
  const OpeningsForm({Key? key}) : super(key: key);

  @override
  MyOpeningsFormState createState() {
    return MyOpeningsFormState();
  }
}

class MyOpeningsFormState extends State<OpeningsForm> {
  final _formKey = GlobalKey<FormState>();
  late FireStoreServices instance = FireStoreServices();
  String? errorMessage;

  @override
  Widget build(BuildContext context) {
    var id = Provider.of<OpeningProvider>(context, listen: false).length;
    var controller1 = TextEditingController();
    var controller2 = TextEditingController();
    var controller3 = TextEditingController();
    return Scaffold(
        body: Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            style: OutlinedButton.styleFrom(
              shape: StadiumBorder(),
              side: BorderSide(color: Colors.black),
            ),
          ),
          Text(
            "Add Opening",
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Raleway',
              color: Colors.black,
            ),
          ),
          TextFormField(
            controller: controller1,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(50.0),
              ),
              hintText: "Name",
            ),
          ),
          TextFormField(
            controller: controller2,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              fillColor: Colors.white,
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(50.0),
              ),
              hintText: "Description",
            ),
          ),
          TextFormField(
            controller: controller3,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 2.0),
                borderRadius: BorderRadius.circular(50.0),
              ),
              hintText: 'Moves',
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (controller1.text.isNotEmpty &&
                    controller2.text.isNotEmpty &&
                    controller3.text.isNotEmpty) {
                  setState(() {
                    instance.addOpenings(controller1.text, controller2.text,
                        controller3.text, id + 1);
                    Navigator.pop(context);
                  });
                }
              },
              child: const Text('Submit'),
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.green.shade900),
              )),
        ],
      ),
    ));
  }
}
