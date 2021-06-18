import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

class FormTextField extends StatefulWidget {
  @override
  _FormTextFieldState createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  String _ad, _soyad, _sifre, _sifretekrar, _email;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form İşlemleri"),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.always,
          child: ListView(
            children: [
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    hintText: "Adınızı giriniz.",
                    labelText: "İsim (*)",
                    border: OutlineInputBorder()),
                validator: (String degeri) {
                  if (degeri.length == 0 ) {
                    return "Lütfen adınızı giriniz.";
                  } else {
                    return null;
                  }
                },
                onSaved: (deger) => _ad = deger,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    hintText: "Soyadınızı giriniz...",
                    labelText: "Soyisim (*)",
                    border: OutlineInputBorder()),
                validator: (String degeri) {
                  //eğer Ad Soyad input değeri < 6 ise uyarı verelim....
                  if (degeri.length == 0) {
                    return "Lütfen soyadınızı giriniz.";
                  } else {
                    return null;
                  }
                },
                onSaved: (deger) => _soyad = deger,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    hintText: "E-posta adresinizi giriniz...",
                    labelText: "E-Posta Adresi (*)",
                    border: OutlineInputBorder()),
                validator: (String degeri) {
                  var email = degeri;
                  bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
                  if (!emailValid) {
                    return "Lütfen geçerli bir e-posta giriniz.";
                  } else {
                    return null;
                  }
                },
                onSaved: (deger) => _email = deger,
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                maxLength: 6,
                keyboardType: TextInputType.number,
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle),
                    hintText: "Şifrenizi (6 hane) giriniz...",
                    labelText: "Şifreniz (*)",
                    border: OutlineInputBorder()),
                validator: (String degeri) {
                  if (degeri.length < 6) {
                    return "Lütfen en az 6 karakter şifre giriniz.";
                  } else {
                    return null;
                  }
                },
                onSaved: (deger) => _sifre = deger,
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                child: Text("KAYDET"),
                onPressed: () => _girisleriKontrolEt(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _girisleriKontrolEt() {
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      debugPrint("İsim = $_ad");
      debugPrint("Soyisim = $_soyad");
      debugPrint("E-posta = $_email");
      debugPrint("Şifre = $_sifre");
      createStudent();
    }else{
      toastMesaj("Lütfen alanları kontrol ediniz.");
      debugPrint("Hatalı alanlar var kontrol et !");
    }
  }

  Future<void> createStudent() async {
    http.Response response = await http.post(
      Uri.parse('https://api.onurylmz.com/mobile-students/create'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'first_name': _ad,
        'last_name': _soyad,
        'email': _email,
        'password': _sifre,
      }),
    );

    if (response.statusCode == 200) {
      toastMesaj("Form Kaydedildi.");
    } else {
      toastMesaj("Form Kaydedilmedi.");
      //throw Exception('Öğrenci kayıdı yapılamadı.');
    }

  }

  toastMesaj(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.orange,
        textColor: Colors.white,
        fontSize: 20.0
    );
  }

}
