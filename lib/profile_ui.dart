import 'dart:math';

import 'package:aaaaaaa/profile_controller.dart';
import 'package:aaaaaaa/TempatLogin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:modul_project/TempatLogin.dart';
//import 'package:modul_project/profile_controller.dart';
import 'package:provider/provider.dart';

import 'package:/aaaaaaa/TempatLogin.dart';

class editProfile2 extends StatefulWidget {
  const editProfile2({Key? key}) : super(key: key);

  @override
  State<editProfile2> createState() => _edit_profile2();
}

class _edit_profile2 extends State<editProfile2> {
  // TextEditingController prefill_username = TextEditingController(text: 'Mustarion');
  // TextEditingController prefill_account = TextEditingController(text: 'c@gmail.com');
  // TextEditingController interest = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final dataProvider = Provider.of<profile>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(right: 20, left: 10),
            child: Consumer<profile>(
              builder: (context, tagsname, _) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: TextButton.icon(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(color: Colors.black),
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => cekLogin()));
                        },
                        icon: const Icon(Icons.arrow_back,
                            size: 32, color: Colors.black),
                        label: const Text('Edit Profile',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ),

                  // const Icon(Icons.account_circle, size: 120, color: Colors.grey),
                  //
                  // const Padding(
                  //   padding: EdgeInsets.only(top: 10, bottom: 25),
                  //   child: Text('Change photo profile', style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w400, fontSize: 20)),
                  // ),

                  Container(
                    height: 256,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black,
                    child: Image.network(
                        'https://wallpaperaccess.com/full/5861334.png'),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 50),
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back_sharp,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(),

                      //output nama
                      const Padding(
                        padding: EdgeInsets.only(bottom: 10, left: 10),
                        child: Text('Nama',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                                fontSize: 16)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          (tagsname.list["first_name"] == null)
                              ? "Kosong"
                              : "${tagsname.list["first_name"] + " " + tagsname.list["last_name"]}",
                          style: TextStyle(color: Colors.blue, fontSize: 18),
                        ),
                      ),

                      //output job
                      const Padding(
                        padding: EdgeInsets.only(top: 40, bottom: 10, left: 10),
                        child: Text('Job',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                                fontSize: 16)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          (tagsname.list["job"] == null)
                              ? "kosong"
                              : "${tagsname.list["job"]}",
                          style: TextStyle(color: Colors.blue, fontSize: 18),
                        ),
                      ),

                      //output email
                      const Padding(
                        padding: EdgeInsets.only(top: 40, bottom: 10, left: 10),
                        child: Text('E-Mail',
                            style: TextStyle(
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                                fontSize: 16)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          (tagsname.list["email"] == null)
                              ? "Kosong"
                              : "${tagsname.list["email"]}",
                          style: TextStyle(color: Colors.blue, fontSize: 18),
                        ),
                      ),
                    ],
                  ),

                  //post
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 35),
                      child: Row(
                        children: [
                          Container(
                            width: 75,
                            // ignore: deprecated_member_use
                            child: ElevatedButton(
                              onPressed: () {
                                dataProvider.connectAPI("Arfian Bayu",
                                    "Developer", "bayu@gmail.com");
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Text("Post",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16)),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Container(
                              width: 90,
                              // ignore: deprecated_member_use
                              child: ElevatedButton(
                                onPressed: () {
                                  dataProvider.connectAPI("Arfian Bayu",
                                      "Developer", "bayu@gmail.com");
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Text("Update",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                ),
                              ),
                            ),
                          ),

                          //get
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Container(
                              width: 65,
                              // ignore: deprecated_member_use
                              child: ElevatedButton(
                                onPressed: () {
                                  dataProvider.getconnectAPI(
                                      (1 + Random().nextInt(10)).toString());
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Text("Get",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                ),
                              ),
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Container(
                              width: 90,
                              // ignore: deprecated_member_use
                              child: ElevatedButton(
                                onPressed: () {
                                  dataProvider.deleteData(context);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Text("Delet",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
