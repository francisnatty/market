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
    //fetchData();
  }

  Future<void> fetchData() async {
    final String apikey = '';
    final String apiUrl = '';

    try {
      final response =
          await http.get(Uri.parse(apiUrl), headers: {'Authorization': ''});
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

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
