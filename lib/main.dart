import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http_flutter/addData.dart';
import 'package:http_flutter/detailPage.dart';

import 'dataclasses.dart';
import 'apiservices.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Service serviceAPI = Service();
  late Future<List<Data>> listData;

  @override
  void initState() {
    // TODO: implement initState
    listData = serviceAPI.getAllData();
    const HomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HTTP Request"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: FutureBuilder<List<Data>>(
                future: listData,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<Data> isData = snapshot.data!;
                    return ListView.builder(
                      itemCount: isData.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            title: Text(isData[index].nama),
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(isData[index].avatar),
                            ),
                            subtitle: Text(isData[index].quote, maxLines: 2),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ProfileDetail(
                                    data: isData[index],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              minimumSize: const Size.fromHeight(45),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddDataPage()),
              );
            },
            child: Text("Tambah Data"),
          ),
        ],
      ),
    );
  }
}
