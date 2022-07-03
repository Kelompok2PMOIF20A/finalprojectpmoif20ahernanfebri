// import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:projectkelompok3_adnanam/Screen/login_daftar.dart';
// import 'package:projectkelompok3_adnanam/Api//Api.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:finalprojectpmo/screens/login.dart';

// import 'package:http/http.dart' as http;
// import 'package:need_resume/need_resume.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController reenterController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;
  bool isRegister = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: 100,
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(top: 20,right: 300),
                child: InkWell(
                    child: Container(
                      child: Image.asset("assets/images/kembali.png"),
                    ),
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) =>login()));
                    }),
              ),
              Container(
                margin: EdgeInsets.only(top: 50),
                height: 500,
                width: 340,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        "assets/images/register.png",
                        width: 200,
                        height: 150,
                      ),
                      Text("Masukkan data diri anda !",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold)),
                      Container(
                        padding: EdgeInsets.all(10),
                        width: 300,
                        // color: Colors.black87,
                        child: TextFormField(
                          controller: usernameController,
                          decoration: InputDecoration(
                            hintText: "Username",
                            hintStyle: TextStyle(color: Colors.white),
                            border: UnderlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white54,
                                width: 3.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        width: 300,
                        // color: Colors.black87,
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.white),
                            border: UnderlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white54,
                                width: 3.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        width: 300,
                        // color: Colors.black87,
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.white),
                            border: UnderlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white54,
                                width: 3.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        width: 300,
                        // color: Colors.black87,
                        child: TextFormField(
                          controller: reenterController,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: "Reenter Password",
                            hintStyle: TextStyle(color: Colors.white),
                            border: UnderlineInputBorder(),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.white54,
                                width: 3.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              (isRegister)
                  ? CircularProgressIndicator(
                color: Colors.green,
              )
                  : SizedBox(
                width: 340,
                height: 35,
                child: ElevatedButton(
                  child: Text('Create new account'),
                  onPressed: () {
                    _register();
                  },
                ),
              ),
              // TextButton(
              //   child: Text("Already registered? Login me",
              //       style: TextStyle(color: Colors.black)),
              //   onPressed: () {
              //     Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => login()));
              //   },
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _register() async {
    if (usernameController.text.trim() == "") {
      Fluttertoast.showToast(
          msg: "username field is required",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 18);
    } else if (emailController.text.trim() == "") {
      Fluttertoast.showToast(
          msg: "email field is required",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 18);
    } else if (passwordController.text.trim() == "") {
      Fluttertoast.showToast(
          msg: "password field is required",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 18);
    } else if (reenterController.text.trim() == "") {
      Fluttertoast.showToast(
          msg: "reenter password field is required",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 18);
    } else {
      setState(() {
        isRegister = true;
      });
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: emailController.text.trim(),
          password: reenterController.text.trim());
      User ? user = FirebaseAuth.instance.currentUser;

      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();

        Navigator.push(
            context, MaterialPageRoute(builder: ((context) => login())));
      }

    }
  }
}