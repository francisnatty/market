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
  late Future<List<ApiModel>> countryList;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    countryList = getData();
  }

  Future<List<ApiModel>> getData() async {
    final response = await http.get(Uri.parse(
        'https://raw.githubusercontent.com/dr5hn/countries-states-cities-database/master/countries%2Bstates.json'));

    if (response.statusCode == 200) {
      print('there is data');
      final List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((json) => ApiModel.fromJson(json)).toList();
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
      body: FutureBuilder<List<ApiModel>>(
          future: countryList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<ApiModel> country = snapshot.data!;

              return ListView.builder(
                  itemCount: country.length,
                  itemBuilder: (context, index) {
                    final StateModel states = country[index].states;
                    return ListTile(
                      title: Text(country[index].name),
                      leading: IconButton(
                        icon: Icon(Icons.arrow_forward_ios),
                        onPressed: () {},
                      ),
                      subtitle: Text(states.name),
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}

class ApiModel {
  final String name;
  final String countryCode;
  final String region;
  final StateModel states;
  //final List<>

  const ApiModel(
      {required this.name,
      required this.countryCode,
      required this.region,
      required this.states});
  factory ApiModel.fromJson(Map<String, dynamic> json) {
    return ApiModel(
        name: json['name'],
        countryCode: json['phone_code'],
        region: json['region'],
        states: json['states']);
  }
}

class StateModel {
  final String name;
  const StateModel({required this.name});
  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(name: json['name']);
  }
}
