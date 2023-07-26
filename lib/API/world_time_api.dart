import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WorldTimeApi extends StatefulWidget {
  const WorldTimeApi({super.key});

  @override
  State<WorldTimeApi> createState() => _WorldTimeApiState();
}

class _WorldTimeApiState extends State<WorldTimeApi> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  Future<List<dynamic>> getData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData;
    } else {
      throw Exception('failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('World Time api'),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              //  print('loading data');
              return Center(
                child: CircularProgressIndicator(color: Colors.blue),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('An Error Occurred'),
              );
            } else {
              final data = snapshot.data;
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    String title = data![index]['title'];
                    String body = data[index]['body'];
                    return ListTile(
                      title: Text(
                        title,
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        body,
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  });
            }
          }),
    );
  }
}
