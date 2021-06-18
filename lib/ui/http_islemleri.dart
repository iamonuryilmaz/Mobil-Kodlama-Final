import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mobil_kodlama_final/model/Gonderi.dart';

class HttpIslemleri extends StatefulWidget {
  @override
  _HttpIslemleriState createState() => _HttpIslemleriState();
}

class _HttpIslemleriState extends State<HttpIslemleri> {
  Gonderi gonderi;

  //bize içinde gönderi olan bir liste gelecek...
  Future<List<Gonderi>> _gonderiGetir() async {
    var response = await http.get(Uri.https('jsonplaceholder.typicode.com', '/posts'));
    if (response.statusCode == 200) {
      //gelen body bir listtir, geriye map olarak dönüştür. ve listeye çevir.
      return (json.decode(response.body) as List).map( (e) => Gonderi.fromJsonMap(e)).toList();
    } else {
      throw Exception("Bağlanamadık ... ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "HTTP İşlemleri",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder(
        future: _gonderiGetir(),
        builder: (BuildContext context, AsyncSnapshot<List<Gonderi>> snapshot) {
          //snapshot o an ki gelen değeri temsil edecek.
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: 55, //snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  color: index % 2 == 0 ? Colors.teal.shade200 : Colors.orange.shade200,
                  elevation: 2,
                  margin: EdgeInsets.all(5),
                  child: ListTile(
                    title: Text(snapshot.data[index].title),
                    subtitle: Text(snapshot.data[index].body),
                    leading: CircleAvatar(
                      child: Text(snapshot.data[index].id.toString()),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
