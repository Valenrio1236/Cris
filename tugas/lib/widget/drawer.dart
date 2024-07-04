import 'package:flutter/material.dart';
import 'package:tugas/screen/beranda.dart';
import 'package:tugas/screen/home.dart';
import 'package:tugas/widget/languageBody.dart';
import 'package:tugas/widget/movieBody.dart';
import 'package:tugas/widget/settingBody.dart';
import 'package:tugas/widget/subscriptionBody.dart';

class Drawers extends StatelessWidget {
  Drawers({super.key, required this.user});

  final Map<String, dynamic> user;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration:
                BoxDecoration(color: const Color.fromARGB(255, 37, 37, 37)),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 142, 142, 142),
                  radius: 30,
                  child: ClipOval(
                    child: Image.network(
                        'https://www.shutterstock.com/image-vector/default-avatar-profile-vector-user-260nw-1705357234.jpg'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        user["username"],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      Text(
                        user["email"],
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Beranda(user: user)),
              );
            },
            leading: Icon(Icons.layers),
            title: Text(
              "General",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MovieBody(user: user)),
              );
            },
            leading: Icon(Icons.movie),
            title: Text(
              "Movies",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Subscription(user: user)),
              );
            },
            leading: Icon(Icons.subscriptions_rounded),
            title: Text(
              "Subscription",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Language(user: user)),
              );
            },
            leading: Icon(Icons.language),
            title: Text(
              "Subtitle",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Settings(user: user)),
              );
            },
            leading: Icon(Icons.settings),
            title: Text(
              "Setting",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Center(child : Text("Log Out", style: TextStyle(fontWeight: FontWeight.bold),)),
                    content: Text("Are you sure you want to log out?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => Home()),
                            (Route<dynamic> route) => false,
                          );
                        },
                        child: Text("Log Out"),
                      ),
                    ],
                  );
                },
              );
            },
            leading: Icon(Icons.logout),
            title: Text(
              "Log Out",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
