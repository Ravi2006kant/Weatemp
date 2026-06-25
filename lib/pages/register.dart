import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:weatemp/pages/home.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

Future<http.Response> getResponse() async {
  return http.get(Uri.parse('uri'));
}

class _RegisterState extends State<Register> {
  final TextEditingController nameControl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          width: 100,
          color: Colors.blue,
          child: Column(
            children: [
              TextField(
                controller: nameControl,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text("value saved")));
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Home()),
                  );
                },
                child: Text("Save"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
