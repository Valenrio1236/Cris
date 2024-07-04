import 'package:flutter/material.dart';
import 'package:tugas/widget/drawer.dart';

class Language extends StatefulWidget {
  Language({super.key, required this.user});

  final Map<String, dynamic> user;

  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  String? _selectedLanguage;

  final List<String> languages = [
    "Indonesian", "English", "Spanish", "French", "German",
    "Italian", "Portuguese", "Dutch", "Russian", "Japanese",
    "Korean", "Mandarin", "Arabic", "Hindi", "Turkish",
    "Swedish", "Norwegian"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Language",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: languages.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const Icon(Icons.language),
            title: Text(languages[index]),
            trailing: Radio<String>(
              value: languages[index],
              groupValue: _selectedLanguage,
              onChanged: (value) {
                setState(() {
                  _selectedLanguage = value;
                });
              },
            ),
            onTap: () {
              setState(() {
                _selectedLanguage = languages[index];
              });
            },
          );
        },
      ),
      drawer: Drawers(user: widget.user),
    );
  }
}
