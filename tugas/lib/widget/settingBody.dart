import 'package:flutter/material.dart';
import 'package:tugas/widget/drawer.dart';

class Settings extends StatefulWidget {
  Settings({super.key, required this.user});

  final Map<String, dynamic> user;

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String cellular = "Low";
  String wifi = "High";
  bool notif = false;
  bool download = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Setting",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          PopupMenuButton(
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                child: ListTile(
                  leading: Icon(Icons.warning),
                  title: Text('Report Bugs')
                ),
              ),
            ],
          ),
        ],
      ),
       body: ListView(
        children: [
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('Quality', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),)),
          ListTile(
            leading: Icon(Icons.signal_cellular_alt),
            title: Text('Using Cellular Data'),
            trailing: DropdownButton<String>(
              value: cellular,
              onChanged: (String? newValue) {
                setState(() {
                  cellular = newValue!;
                });
              },
              items: <String>["Low", "Medium", "High"]
                  .map<DropdownMenuItem<String>>((String n) {
                return DropdownMenuItem<String>(
                  value: n,
                  child: Text(n),
                );
              }).toList(),
            ),
          ),
          ListTile(
            leading: Icon(Icons.wifi),
            title: Text('Using Wi-Fi'),
            trailing: DropdownButton<String>(
              value: wifi,
              onChanged: (String? newValue) {
                setState(() {
                  wifi = newValue!;
                });
              },
              items: <String>["Low", "Medium", "High"]
                  .map<DropdownMenuItem<String>>((String n) {
                return DropdownMenuItem<String>(
                  value: n,
                  child: Text(n),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('Notification', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),)),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Allow Notification'),
            trailing: Switch(
              value: notif,
              onChanged: (bool n) {
                setState(() {
                  notif = n;
                });
              },
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('Download', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),)),
          ListTile(
            leading: Icon(Icons.wifi),
            title: Text('Only Wi-Fi'),
            trailing: Switch(
              value: download,
              onChanged: (bool n) {
                setState(() {
                  download = n;
                });
              },
            ),
          ),
        ],
      ),
      drawer: Drawers(user: widget.user),
    );
  }
}
