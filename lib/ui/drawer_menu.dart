import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("Grup x Final Çalışması"),
            accountEmail: Text("Mobil Kodlama"),
            currentAccountPicture: Image.asset("assets/igun_logo.png"),
            otherAccountsPictures: [
              CircleAvatar(
                child: Text("İGÜ"),
                backgroundColor: Colors.pink,
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.people),
                  title: Text("ÇALIŞMA GRUBU"),
                  trailing: Icon(Icons.arrow_forward_sharp),
                  onTap: () => Navigator.pushNamed(context, "/WorkingGroup"),
                ),
                Divider(
                  height: 10,
                ),
                ListTile(
                  leading: Icon(Icons.http),
                  title: Text("HTTP GET İŞLEMLERİ"),
                  trailing: Icon(Icons.arrow_forward_sharp),
                  onTap: () => Navigator.pushNamed(context, "/HttpIslemleri"),
                ),
                Divider(
                  height: 10,
                ),
                ListTile(
                  leading: Icon(Icons.add_link),
                  title: Text("FORM İŞLEMLERİ"),
                  trailing: Icon(Icons.arrow_forward_sharp),
                  onTap: () => Navigator.pushNamed(context, "/FormValidation"),
                ),
                SizedBox(
                  height: 50,
                ),
                AboutListTile(
                  icon: Icon(Icons.android),
                  applicationName: "Mobil Kodlama Dersi",
                  applicationVersion: "1.0.0",
                  applicationIcon: Icon(Icons.android),
                  child: Text("HAKKINDA"),
                  applicationLegalese: "2021 Yılı",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
