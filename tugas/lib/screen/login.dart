import 'package:flutter/material.dart';
import 'package:tugas/data/user.dart';
import 'package:tugas/screen/beranda.dart';

class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  bool isLogin = true;

  void _login(BuildContext ctx) {
    List<Map<String, dynamic>> accountExist =
        listUsers.where((user) => user["email"] == _email.text).toList();

    if (accountExist.isNotEmpty) {
      Map<String, dynamic> account = accountExist[0];

      if (account["email"] == _email.text &&
          account["password"] == _password.text) {
        Navigator.of(ctx).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => Beranda(user: account,),
            ),
            (route) => false);

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Login berhasil!")));
        return;
      }
    }

    setState(() {
      isLogin = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Row(
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
                const Text("Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      color: Colors.white,
                    )),
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
                SizedBox(
                  height: 30,
                  child: Text(
                    isLogin ? "" : "Email / Password Salah",
                    style: const TextStyle(color: Colors.red, fontSize: 15),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    _login(context);
                  },
                  child: const Text('Submit'),
                ),
              ],
            )));
  }
}
