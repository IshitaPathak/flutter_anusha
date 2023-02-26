import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class contact extends StatefulWidget {
  const contact({super.key});

  @override
  State<contact> createState() => _contactState();
}

class _contactState extends State<contact> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("User form"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              const Text("User Name"),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                controller: username,
                decoration: InputDecoration(
                  hintText: "Enter User Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(),
                  ),
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter user name';
                  }
                  return null;
                },
              ),
              TextFormField(
                obscureText: true,
                controller: password,
                decoration: InputDecoration(
                  hintText: "Enter User password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(),
                  ),
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter user password';
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    print("Validated");
                    print(
                        "User Name ${username.text},password ${password.text}");
                    //print(username.Text);
                    //print(passwor.Text);
                    Map<String, dynamic> useRequiredData = {
                      "user_name": username.text,
                      "password": password.text,
                    };
                    //Store data in firestore firebase
                    FirebaseFirestore.instance
                        .collection('users')
                        .add(useRequiredData);
                  } else {
                    print("Not Validated");
                  }
                },
                child: const Text('Submit'),
              ),
            ],
            // Add TextFormFields and ElevatedButton here.
          ), //listview
        ),
      ), //form
    );
  }
}
