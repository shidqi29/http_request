import 'package:flutter/material.dart';
import 'apiservices.dart';
import 'dataclasses.dart';

class AddDataPage extends StatefulWidget {
  const AddDataPage({super.key});

  @override
  State<AddDataPage> createState() => _AddDataPageState();
}

class _AddDataPageState extends State<AddDataPage> {
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController addressC = TextEditingController();
  TextEditingController avatarC = TextEditingController();
  TextEditingController jobC = TextEditingController();
  TextEditingController quoteC = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    nameC.dispose();
    emailC.dispose();
    addressC.dispose();
    avatarC.dispose();
    jobC.dispose();
    quoteC.dispose();
    super.dispose();
  }

  Service serviceAPI = Service();

  late Future<List<Data>> listData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    listData = serviceAPI.getAllData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tambah Data"),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: emailC,
            autocorrect: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Email",
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: nameC,
            autocorrect: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Name",
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            autocorrect: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Address",
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: jobC,
            autocorrect: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Job",
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: quoteC,
            autocorrect: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Quote",
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            controller: avatarC,
            autocorrect: false,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Avatar",
            ),
          ),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                addData();
                Navigator.pop(context);
              },
              child: Text("SUBMIT"))
        ],
      ),
    );
  }

  void addData() async {
    bool response = await serviceAPI.postData(nameC.text, avatarC.text,
        addressC.text, emailC.text, jobC.text, quoteC.text);

    if (response == true) {
      setState(() {
        listData = serviceAPI.getAllData();
      });
    }
  }
}
