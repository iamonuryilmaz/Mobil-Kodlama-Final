import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class WorkingGroup extends StatelessWidget {
  List<Ogrenci> tumOgrenciler = [
    Ogrenci("Öğrenci Adı Soyadı", "1900001", "Yaptığı işlerden çok kısa açıklama", false),
    Ogrenci("Öğrenci Adı Soyadı", "1900002", "Yaptığı işlerden çok kısa açıklama", true),
    Ogrenci("Öğrenci Adı Soyadı", "1900003", "Yaptığı işlerden çok kısa açıklama", false),
    Ogrenci("Öğrenci Adı Soyadı", "1900004", "Yaptığı işlerden çok kısa açıklama", true),
  ];

  @override
  Widget build(BuildContext context) {
    debugPrint(tumOgrenciler.toString());
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Çalışma Grubu X Listesi",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
        itemCount: tumOgrenciler.length,
        itemBuilder: (context, index) {

          return Card(
            elevation: 3,
            child: ListTile(
              leading: CircleAvatar(
                //child: Icon(Icons.android),
                child: tumOgrenciler[index]._cinsiyet == true ? Text("E") : Text("K"),
                radius: 20,
              ),
              title: Text(tumOgrenciler[index]._isimsoyisim),
              subtitle: Text(tumOgrenciler[index]._numara),
              trailing: Icon(Icons.arrow_forward_sharp),
              tileColor: tumOgrenciler[index]._cinsiyet == true ? Colors.blue.shade200 : Colors.pink.shade200,
              onTap: (){
                /*Fluttertoast.showToast(
                    msg: tumOgrenciler[index]._gorevi,
                    toastLength: Toast.LENGTH_LONG,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.orange,
                    textColor: Colors.white,
                    fontSize: 20.0
                );**/
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("${tumOgrenciler[index]._isimsoyisim} (${tumOgrenciler[index]._numara})"),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: [
                              Text("${tumOgrenciler[index]._isimsoyisim}"),
                              Text("${tumOgrenciler[index]._gorevi}"),
                            ],
                          ),
                        ),
                        actions: [
                          ButtonBar(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("TAMAM"),
                              ),
                            ],
                          ),
                        ],
                      );
                    }
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class Ogrenci {
  String _isimsoyisim;
  String _numara;
  String _gorevi;
  bool _cinsiyet;

  Ogrenci(this._isimsoyisim, this._numara, this._gorevi, this._cinsiyet);
}
