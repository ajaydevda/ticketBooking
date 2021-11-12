import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

abstract class AppRepo1 {
  Future<dynamic> postApiResponse({
    required jsonPostData,
        required api});

  Future<dynamic> putApiResponse({
    required jsonPostData,
    required api});

  Future<dynamic> getApiResponse({
    required jsonPostData,
    required api});

}

class AppRepo extends AppRepo1 {



  @override
  Future<dynamic> putApiResponse({jsonPostData, api}) async {

    print("====url===>" + api);
    print("====request===>" + jsonPostData);

    var response = await http.put(Uri.parse(api), body: jsonPostData, headers: {"Content-Type": "application/json"});

    debugPrint("response>>" + response.body.toString(), wrapWidth: 1024);

    print("====request===>" + response.statusCode.toString());

    var data =  json.decode(response.body);
    return data;

  }



  @override
  Future<dynamic> postApiResponse({jsonPostData, api}) async {

    try {
      print("====url===>" + api);
      print("====request===>" + jsonPostData);

      var response = await http.post(Uri.parse(api), body: jsonPostData,
          headers: {"Content-Type": "application/json"});

      debugPrint("response>>" + response.body.toString(), wrapWidth: 1024);

      print("====request===>" + response.statusCode.toString());

      var data = json.decode(response.body);
      return data;
    }
    catch(e)
    {
      print(e);
    }
  }


  @override
  Future<dynamic> getApiResponse({jsonPostData, api}) async {

    try {
      print("====url===>" + api);
      print("====request===>" + jsonPostData);

      var response = await http.get(Uri.parse(api),
          headers: {"Content-Type": "application/json"});

      debugPrint("response>>" + response.body.toString(), wrapWidth: 1024);

      print("====request===>" + response.statusCode.toString());

      var data = json.decode(response.body);
      return data;
    }
    catch(e)
    {
      print(e);
    }
  }

}
