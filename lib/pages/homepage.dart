import 'package:flutter/material.dart';
import 'signin.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("WELCOME",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),),
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
          child: SingleChildScrollView(child: Padding(padding: EdgeInsets.fromLTRB(20, MediaQuery.of(context).size.height*0.1, 20, 0),
              child: Column(
                children: [
                  Image.asset("assets/logo.png",
                  width: 500,
                  height: 500,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.1,),
                  ElevatedButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignIn()));
                  },
                    style: ButtonStyle(
                      backgroundColor:MaterialStateProperty.all(Colors.pinkAccent),
                    ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("NEXT",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),),
                      ),

                  ),
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
