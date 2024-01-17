import 'dart:ui';
import 'package:aaaaaaa/Auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dummy_data.dart';
import 'main.dart';


class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
//buat nyimpen
  bool cekLogin = false;

  @override
  void initState() {
    super.initState();
    checkLoggedIn();
  }

  void checkLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    cekLogin = prefs.getBool('loggedIn') ?? false;
    if(cekLogin == true) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) =>  NavgasiBawahBar())
      );
    }
  }

  @override
  Widget build(BuildContext context) {

    //lihat login
    void Pengecekan() async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
        for(int id = 0; id < DummyData.data.length; id++){

          if(userController.text == DummyData.data[id]["username"] && pwdController.text == DummyData.data[id]["password"]){
            prefs.setString('fullname', DummyData.data[id]["nama"]);
            prefs.setString('nim', DummyData.data[id]["Nim"]);
            prefs.setBool('loggedIn', true);
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => NavgasiBawahBar())
            );
          }
        }
    }
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    height: 220,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Image.network('https://i0.wp.com/digstraksi.com/wp-content/uploads/2020/04/New-Project.jpg'),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(left: 10, top: 50),
                  //   child: IconButton(
                  //     onPressed: (){
                  //       Navigator.pop(context);
                  //     },
                  //     icon: Icon(Icons.arrow_back_sharp, size: 30, color: Colors.white,),
                  //   ),
                  // ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                //color: Colors.blue,
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 10, left: 50, right: 50),
                      child: TextField(
                        controller: userController,
                        decoration: InputDecoration(hintText: 'Email'),
                      ),
                    ),Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 50, right: 50),
                      child: TextField(
                        controller: pwdController,
                        decoration: InputDecoration(hintText: 'Password'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                              onPressed: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_) => Register()),
                                );
                              },
                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                              child: Text('Register')
                          ),
                          Padding(padding: EdgeInsets.only(right: 80,)),
                          ElevatedButton(
                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                              child: Text('Login'),
                              onPressed: () async {
                                User? user = await AuthenticationService().signIn(email: userController.text, password: pwdController.text);
                                if (user != null) {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (_) => NavgasiBawahBar()));
                                }
                              }
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Container(
            //   color: Colors.white,
            //   width: MediaQuery.of(context).size.width,
            //   height: 436,
            // ),
          ],
        ),
      ),
    );
  }
}


class cekLogin extends StatefulWidget {
  @override
  State<cekLogin> createState() => _cekLoginState();
}

class _cekLoginState extends State<cekLogin> {

  String nama = '';
  String nim = '';

  @override
  void initState() {
    super.initState();
    ambilNama();
  }
  //mengambil nilai
  void ambilNama() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    setState(() {
      nama = prefs.getString('fullname')!;
      nim = prefs.getString('nim')!;
    });
  }
  //logout
  void logOut() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    prefs.remove('loggedIn');
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) =>  Login())
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    height: 256,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black,
                    child: Image.network('https://wallpaperaccess.com/full/5861334.png'),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 50),
                    child: IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_sharp, size: 30, color: Colors.white,),
                    ),
                  ),
                  Container(
                    height: 256,
                    width: MediaQuery.of(context).size.width,
                    //color: Colors.blue,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          child: Icon(Icons.account_circle_rounded, color: Colors.white, size: 60,),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          height: 256,
                          //color: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Stack(
                                  children: [
                                    Text(
                                      nama,
                                      style: TextStyle(
                                        fontSize: 20,
                                        letterSpacing: 2,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 5
                                          ..color = Colors.black,
                                      ),
                                    ),
                                    // The text inside
                                     Text(
                                      nama,
                                      style: TextStyle(
                                        fontSize: 20,
                                        letterSpacing: 2,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Stack(
                                  children: [
                                    Text(
                                      nim,
                                      style: TextStyle(
                                        fontSize: 15,
                                        letterSpacing: 5,
                                        foreground: Paint()
                                          ..style = PaintingStyle.stroke
                                          ..strokeWidth = 5
                                          ..color = Colors.black,
                                      ),
                                    ),
                                    // The text inside
                                   Text(
                                     nim,
                                     style: TextStyle(
                                       fontSize: 15,
                                       letterSpacing: 5,
                                       color: Colors.white70,
                                     ),
                                   ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10,right: 39),
                    child: ElevatedButton(
                        onPressed: logOut,
                        style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
                        child: Text('Logout')
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController regUserController = TextEditingController();
  TextEditingController regPwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    height: 207,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Image.network('https://webtoons-static.pstatic.net/image/pc/home/og_id.jpg?dt=2019090201'),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 50),
                    child: IconButton(
                      onPressed: (){
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back_sharp, size: 30, color: Colors.white,),
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                //color: Colors.blue,
                child: Column(
                  children: [
                    Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(top: 10, left: 50, right: 50),
                      child: TextFormField(
                        validator: (value){
                          if(value!.length < 8) {
                            return 'Error';
                          }
                        },
                        controller: regUserController,
                        decoration: InputDecoration(hintText: 'Email'),
                      ),
                    ),Container(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(left: 50, right: 50),
                      child: TextFormField(
                        validator: (value){
                          if(value!.length < 8) {
                            return 'Error';
                          }
                        },
                        controller: regPwdController,
                        decoration: InputDecoration(hintText: 'Password'),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(

                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
                             child: Text('Register'),
                            onPressed: () {
                              AuthenticationService().signUp(
                                  email: regUserController.text,
                                  password: regPwdController.text);
                              if(regUserController.text.isEmpty & regPwdController.text.isEmpty){
                                return null;
                              }
                              Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(builder: (_) => Login()));

                              Padding(padding: EdgeInsets.only(right: 80,));
                            }
                          ),
                        ],
                      ),
                    ),
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
