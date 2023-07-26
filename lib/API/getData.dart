import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GetData extends StatefulWidget {
  const GetData({super.key});

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  // final String ApiUrl =
  //     'https://pro-api.coinmarketcap.com/v2/cryptocurrency/market-pairs/latest';
  // Map<String, dynamic> data = {};
  //ar url=Uri.parse(ApiUrl)
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

//getting data from coinmarketcapApi
  Future<void> fetchData() async {
    // final String apikey = '';
    final String apiUrl =
        'https://pro-api.coinmarketcap.com/v1/cryptocurrency/category';

    try {
      final response = await http.get(Uri.parse(apiUrl), headers: {
        'X-CMC_PRO_API_KEY': '1c03e11a-f2e8-4927-b4f5-29a02d6681c9'
      });
      if (response.statusCode == 200) {
        print('SUCESSFUL');
        print('Data:${response.body}');
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      //exception handling
      print('Exception occurred: $e');
    }
  }

// final  const  X-CMC_PRO_API_KEY='';
// 1c03e11a-f2e8-4927-b4f5-29a02d6681c9

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        child: Column(children: [Text('trying to get data')]),
      )),
    );
  }
}
