import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:login_firebase/pages/homepage.dart';
import 'package:login_firebase/pages/signin.dart';
import 'package:login_firebase/reusable_widget/reusable_widget.dart';
class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _passwordTextController=TextEditingController();
  TextEditingController _emailTextController=TextEditingController();
  TextEditingController _userNameTextController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          title: Text("Sign Up Now!"),
          backgroundColor: Colors.transparent,
        ),
        body: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors:[
                  Colors.redAccent.shade400,
                  Color(0xFF6600ff),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(20, 120, 20, 0),
              child: Column(
                children: [
                  Image.asset("assets/logo.png",
                  width: 150,
                  height: 150,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                  reusableTextField("Enter Name", Icons.person, false, _userNameTextController),
                  SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                  reusableTextField("Enter Email Id", Icons.person_add, false, _emailTextController),
                  SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                  reusableTextField("Create Password", Icons.lock, true, _passwordTextController),
                  SizedBox(height: MediaQuery.of(context).size.height*0.05,),
                  Button(context, false, () {
                    FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text).then((value) {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
                    }).onError((error, stackTrace){

                      //print("Error");
                      AlertDialog alert = AlertDialog(
                        title: Text("Warning"),
                        content: Text("Enter Valid Email / Password"),
                        actions: [
                       TextButton(
                      child: Text("OK"),
                          onPressed: () {
                        Navigator.pop(context);
                          },
                      )
                        ],
                      );
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return alert;
                        },
                      );
                    });
                  }),
                  IconButton(onPressed:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                  },
                      icon: Icon(Icons.home,
                      color: Colors.white,
                      size: 50,),
                  ),
                ],
              ),
            ),

          ),
        ),
      ),
    );
  }
}

