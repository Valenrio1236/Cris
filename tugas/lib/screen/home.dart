import 'package:flutter/material.dart';
import 'package:tugas/screen/login.dart';
import 'package:tugas/screen/singup.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
        ),
        backgroundColor: Color.fromARGB(220, 0, 0, 0),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                'https://t4.ftcdn.net/jpg/02/81/09/29/360_F_281092993_Q88asqHBPWEKsFndtyqM2eX7gPXAEy2V.jpg',
                height: 300,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              Center(
                child: Column(
                  children: [
                    Text("Welcome to POUKI STREAM",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          color: Colors.white,
                        )),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Switch(
                          value: switchValue,
                          onChanged: (value) {
                            setState(() {
                              switchValue = value;
                            });
                          },
                        ),
                        Text(
                          "Are you ready to stream?",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 196, 196, 196)),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      width: 500,
                      height: 40,
                      child: ElevatedButton(
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: switchValue
                            ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()),
                                );
                              }
                            : null,
                      ),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      width: 500,
                      height: 40,
                      child: ElevatedButton(
                        child: Text('Sign Up'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        onPressed: switchValue
                            ? () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signup()),
                                );
                              }
                            : null,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
