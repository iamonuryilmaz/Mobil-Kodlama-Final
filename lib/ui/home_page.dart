import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobil_kodlama_final/ui/drawer_menu.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Mobil Kodlama (Final Sınavı)",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: GridView.count(
        crossAxisCount: 1,
        scrollDirection: Axis.vertical,
        primary: true,
        padding: EdgeInsets.all(10),
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: [
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              color: Colors.orange.shade300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    child: Icon(
                      Icons.people,
                      size: 64,
                      color: Colors.white,
                    ),
                    radius: 50,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "ÇALIŞMA GRUBU\nBİLGİLERİ",
                    style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            onTap: () => Navigator.pushNamed(context, "/WorkingGroup"),
          ),
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              color: Colors.green.shade300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.pink,
                    child: Icon(
                      Icons.http,
                      size: 64,
                      color: Colors.white,
                    ),
                    radius: 50,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "HTTP GET İŞLEMLERİ",
                    style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            onTap: () => Navigator.pushNamed(context, "/HttpIslemleri"),
          ),
          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              color: Colors.indigo.shade300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.orange,
                    child: Icon(
                      Icons.add_link,
                      size: 64,
                      color: Colors.white,
                    ),
                    radius: 50,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "FORM İŞLEMLERİ",
                    style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            onTap: () => Navigator.pushNamed(context, "/FormValidation"),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.info, size: 32, color: Colors.purple,),
        onPressed: () => toastMesaj(),
      ),
      drawer: DrawerMenu()
    );
  }

  toastMesaj() {
    Fluttertoast.showToast(
        msg: "2020 - 2021 BLG206 Final Sınavı",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        fontSize: 20.0
    );
  }
}
