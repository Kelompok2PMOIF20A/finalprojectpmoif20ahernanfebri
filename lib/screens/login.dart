import 'package:finalprojectpmo/screens/navigation_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:finalprojectpmo/screens/register_view.dart';
import 'package:finalprojectpmo/screens/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:email_validator/email_validator.dart';

class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();

}

class _loginState extends State<login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height:1),
                Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Image.asset("assets/images/male.png",scale:5),
                SizedBox(height: 10),
                Text(
                  "Silahkan masukkan nama dan password anda!!!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: TextFormField(
                    controller: emailController,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                    decoration: InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: "Email",
                      labelStyle: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(),
                          labelText: "Password",
                          labelStyle: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                          )),
                    )),
                SizedBox(height: 10),
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: FlatButton(
                    color: Colors.white,
                    textColor: Colors.brown,
                    onPressed: () {
                      _login();
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                TextButton(
                  child: Text("Do you haven't an account? Register", style: TextStyle(color: Colors.black)),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _login() async {
    if (emailController.text.trim() == "") {
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
    } else if (!EmailValidator.validate(emailController.text)){
      Fluttertoast.showToast(
          msg: "format email salah",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 18);
      // } else if(LengthLimitingTextInputFormatter != 5) {
      //   Navigator.push(context, MaterialPageRoute(builder: (context)=> DashbordAdmin()));
    }
    else {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailController.text.trim(),
          password: passwordController.text.trim());

      Navigator.push(
          context, MaterialPageRoute(builder: ((context) =>HomePage ())));
    }

  }
}