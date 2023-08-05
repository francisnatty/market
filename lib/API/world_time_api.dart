import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_indicator/loading_indicator.dart';

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
        title: Text('Getting data from an Api'),
      ),
      body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              //  print('loading data');
              return Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: LoadingIndicator(
                    colors: [
                      Colors.blue,
                      Colors.purple,
                      Colors.orange,
                      Colors.green
                    ],
                    strokeWidth: 10.0,
                    indicatorType: Indicator.ballZigZag,
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('No internet connection'),
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
