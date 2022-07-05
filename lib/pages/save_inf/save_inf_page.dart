import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SaveInf extends StatefulWidget {
  const SaveInf({Key? key}) : super(key: key);

  @override
  State<SaveInf> createState() => _SaveInfState();
}

class _SaveInfState extends State<SaveInf> {
  final nameController = TextEditingController();
  final ageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: "Name",
                hintStyle: TextStyle(
                  color: Colors.black26,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            TextField(
              controller: ageController,
              decoration: InputDecoration(
                hintText: "Age",
                hintStyle: TextStyle(
                  color: Colors.black26,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            // DateTimeField(
            //   controller: birthdayController,
            //   decoration: InputDecoration(
            //     hintText: "Birthday",
            //     hintStyle: TextStyle(
            //       color: Colors.black26,
            //       fontStyle: FontStyle.italic,
            //     ),
            //   ),
            //   format: format,
            //   onShowPicker: (context, currentValue) async {
            //     final date = await showDatePicker(
            //         context: context,
            //         firstDate: DateTime(1900),
            //         initialDate: currentValue ?? DateTime.now(),
            //         lastDate: DateTime(2100));
            //     if (date != null) {
            //       final time = await showTimePicker(
            //         context: context,
            //         initialTime:
            //             TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
            //       );
            //       return DateTimeField.combine(date, time);
            //     } else {
            //       return currentValue;
            //     }
            //   },
            // ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  final user = User(
                      name: nameController.text,
                      age: ageController.text);
                  saveUser(user);
                },
                child: Text('Save'))
          ],
        ),
      ),
    );
  }
}

Future saveUser(User user) async {
  final docUser = FirebaseFirestore.instance.collection('users').doc();
  user.id = docUser.id;
  final json = user.toJson();
  await docUser.set(json);
}


class User {
    String? name;
    String? id;
    String? age;

    User({this.name, this.id, this.age});

    User.fromJson(Map<String, dynamic> json) {
        this.name = json["name"];
        this.id = json["id"];
        this.age = json["age"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data["name"] = this.name;
        data["id"] = this.id;
        data["age"] = this.age;
        return data;
    }
}