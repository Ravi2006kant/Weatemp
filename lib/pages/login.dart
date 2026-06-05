import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController taskController = TextEditingController();
  late String weatherData;
  @override
  void initState() {
    super.initState();
    setState(() {
      weatherData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 25),
            Center(
              child: Container(
                width: 250,
                height: 300,
                color: Colors.blue,
                child: Column(
                  children: [
                    TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: taskController,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // FirebaseFirestore.instance.collection("tasks").add({
                        //   "title": taskController.text,
                        // });
                  
                    
                      },
                      child: Text("Add"),
                    ),

                    
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
