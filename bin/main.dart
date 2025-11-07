import 'package:http/http.dart';
import 'dart:convert';
import 'package:dart_assincronismo/api_key.dart';

void main() {
  // print("Olá, mundo!");
  // requestData();
  // requestDataAsync();

  sendDataAsync({
    "id": "NEW001",
    "name": "Flutter",
    "lastName": "Dart",
    "balance": 5000,
  });
}

requestData() {
  String url = "https://gist.githubusercontent.com/ricarthlima/a0eb198cb7a70696c4031e7e577de0cd/raw/356ce2c39dfd58d3d2e948d1ad87ea828544f1db/accounts.json";
  Future<Response> futureResponse = get(Uri.parse(url));
  print(futureResponse);
  futureResponse.then((Response response) {
      print(response);
      print(response.body);
      List<dynamic> listAccounts = json.decode(response.body);

      Map<String, dynamic> mapCarla = listAccounts.firstWhere(
        (element) => element["name"] == "Carla",
      );

      print(mapCarla["balance"]);
    }
  );

  print("Última coisa a acontecer na função.");
}

Future<List<dynamic>> requestDataAsync() async {
  String url = "https://gist.githubusercontent.com/Duda-Martins/ef4e3a9a9f160a2180edbdd71c0ba0a9/raw/13efb40729578124e96ebae30cd6c608805ef478/accounts.json";
  Response response = await get(Uri.parse(url));
  
  return json.decode(response.body);
}

sendDataAsync(Map<String, dynamic> mapAccount) async {
  List<dynamic> listAccounts = await requestDataAsync();
  listAccounts.add(mapAccount);
  String content = json.encode(listAccounts);

  String url = "https://api.github.com/gists/ef4e3a9a9f160a2180edbdd71c0ba0a9";

  Response response = await post(
    Uri.parse(url),
    headers: {"Authorization": "Bearer $githubApiKey"},
    body: json.encode({
      "description": "account.json",
      "public": true,
      "files": {
        "accounts.json": {
          "content": content,
        }
      }
    }),
  );
  print(response.statusCode);
}