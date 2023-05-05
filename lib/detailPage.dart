import 'dart:developer';

import 'package:flutter/material.dart';

import 'apiservices.dart';
import 'dataclasses.dart';

class ProfileDetail extends StatefulWidget {
  ProfileDetail({super.key, this.data});
  Data? data;
  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  Service serviceAPI = Service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Card(
              elevation: 20,
              margin: EdgeInsets.all(10),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Container(
                        width: 103,
                        height: 103,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(widget.data!.avatar),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.data!.nama,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(widget.data!.email),
                          Text(widget.data!.alamat),
                          Text(widget.data!.pekerjaan),
                          Text(widget.data!.quote),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    deleteData(widget.data!.id);
                  },
                  child: Text("Hapus Data"),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text("Update Data"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // void showData(String id) async {
  //   Data response = await serviceAPI.getSingleData(id);
  // }

  void deleteData(String id) async {
    bool response = await serviceAPI.deleteData(id);
    // if (response == true) {
    //   setState(() {
    //   });
    // }
  }
}
