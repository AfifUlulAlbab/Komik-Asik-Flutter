import 'package:aaaaaaa/model/komikmodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:ui';

class KomikDetail extends StatefulWidget{
  final dynamic judul;
  final List<Map<String, dynamic>> eps;
  final dynamic url;

  const KomikDetail({
   Key? key, this.judul, required this.eps, this.url
  }) : super(key: key);

  @override
  State<KomikDetail> createState() => _KomikDetailState();
}

class _KomikDetailState extends State<KomikDetail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    height: 270,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.black,
                    child: Image.network(widget.url),
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
                    margin: EdgeInsets.only(left: 200, top: 20),
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => pagediamon()),
                            );
                          },
                          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueAccent)),
                          child: Text('BELI KOMIK', style: TextStyle(color: Colors.black),),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height:MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Colors.black87,
              child: ListView.builder(
                itemCount: widget.eps.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      height: 90,
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(border: Border.all(color: Colors.white70)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(widget.eps[index]['id'], style: TextStyle(color: Colors.white, fontSize: 20),),
                          Text(widget.eps[index]['title'], style: TextStyle(color: Colors.white, fontSize: 20),),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
