import 'package:flutter/material.dart';
import 'ui/form_validation.dart';
import 'ui/home_page.dart';
import 'ui/http_islemleri.dart';
import 'ui/working_group.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        '/HttpIslemleri': (context) => HttpIslemleri(),
        '/WorkingGroup': (context) => WorkingGroup(),
        '/FormValidation': (context) => FormTextField(),
      },
      theme: ThemeData(primaryColor: Colors.teal, accentColor: Colors.orange),
    ),
  );
}
