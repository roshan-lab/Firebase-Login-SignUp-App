
import 'package:flutter/material.dart';
import 'package:login_firebase/main.dart';
import 'package:login_firebase/pages/signup.dart';

import '../reusable_widget/reusable_widget.dart';
class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController _passwordTextController=TextEditingController();
  TextEditingController _emailTextController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
           title: Text("Sign In"),
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
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height*.1,20, 0),
                  child: Column(
                    children:[
                      logoWidget("assets/logo.png"),
                      SizedBox(
                        height: MediaQuery.of(context).size.height*.1,
                      ),
                      reusableTextField("Enter Username", Icons.person, false, _emailTextController),
                      SizedBox(height: MediaQuery.of(context).size.height*0.04,),
                      reusableTextField("Enter Password", Icons.lock_sharp, true, _passwordTextController),
                      SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                      Button(context, true, (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MyApp()));
                      }),
                      SignupOption(context),
                      SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
    );
  }
}

Row SignupOption(BuildContext context){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("Don't have an account? ",
        style: TextStyle(color:Colors.white70,
        fontSize: 16),
      ),
      GestureDetector(
        onTap:() {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const SignupPage()),
          );
        },
        child: Text("SignUp",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
        ),
      ),
    ],
  );
}
