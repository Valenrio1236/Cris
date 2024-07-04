import 'package:flutter/material.dart';
import 'package:tugas/data/user.dart';
import 'package:tugas/screen/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool already = false;
  bool registered = false;

  void signup() {
    List<Map<String, dynamic>> checkAlready =
        listUsers.where((user) => user["email"] == _email.text).toList();
    if (checkAlready.isNotEmpty) {
      setState(() {
        already = true;
      });
      return;
    }

    listUsers.add({
      "username": _username.text,
      "email": _email.text,
      "password": _password.text,
    });

    _username.clear();
    _email.clear();
    _password.clear();
    setState(() {
      registered = true;
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Sign Up berhasil!"))
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image(
                image: AssetImage('assets/logo.png'),
                height: 40,
                fit: BoxFit.cover),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pouki',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Text(
                  'Stream',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.black,
        iconTheme: IconThemeData(color: Colors.white),
      ),
      backgroundColor: Color.fromARGB(220, 0, 0, 0),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign Up",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.white,
                )),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Username',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              controller: _username,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                hintText: 'Email',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              controller: _email,
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Password',
                fillColor: Colors.white,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              controller: _password,
            ),
            SizedBox(height: 20),
            registered
                ? SizedBox(
                    child: Text(
                      "",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  )
                : SizedBox(
                    child: Text(
                      already ? "Email sudah terdaftar" : "",
                      style: TextStyle(color: Colors.red, fontSize: 15),
                    ),
                  ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: signup,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
