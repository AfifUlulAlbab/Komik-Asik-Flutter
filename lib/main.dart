
import 'dart:ui';

import 'package:aaaaaaa/KontenEpisode.dart';
import 'package:aaaaaaa/firebase_options.dart';
import 'package:aaaaaaa/model/komikmodel.dart';
import 'package:aaaaaaa/provider/komikprovider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'IsiKomik.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'TempatLogin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>KomikProvider(listModel: listModel))
    ],child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blueGrey,
      ),
      home: Login(), //diubah buat run
    ),
    );
  }
}

class Utama extends StatefulWidget {
  const Utama({Key? key}) : super(key: key);

  @override
  State<Utama> createState() => _UtamaState();
}

class _UtamaState extends State<Utama> {



  @override
  Widget build(BuildContext context) {
    final komikProvider = Provider.of<KomikProvider>(context);
    return SingleChildScrollView(

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    child: Stack(
                      children: [
                        Container(
                          child: Image.network('https://wallpaper.dog/large/5530648.jpg'),
                        ),
                        Container(
                          child: IconButton(icon: Icon(Icons.search, size: 40, color: Colors.white,), onPressed: null,),
                          padding: EdgeInsets.only(left: 340,top: 30),

                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Stack(
                      children: [

                        Container(
                          child: Image.network('https://wallpaper.dog/large/10868396.jpg'),
                        ),
                        Container(
                          child: IconButton(icon: Icon(Icons.search, size: 40, color: Colors.white,), onPressed: null,),
                          padding: EdgeInsets.only(left: 340,top: 30),

                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Stack(
                      children: [

                        Container(
                          child: Image.network('https://mcdn.wallpapersafari.com/medium/27/58/0WVrkh.jpg'),
                        ),
                        Container(
                          child: IconButton(icon: Icon(Icons.search, size: 40, color: Colors.white,), onPressed: null,),
                          padding: EdgeInsets.only(left: 340,top: 30),

                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text('Favorite', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),),
                  padding: EdgeInsets.only(left: 20, bottom: 0, top: 10),
                ),
                Container(
                  child: IconButton(
                      onPressed: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //       builder: (_) => Favorit(),
                        //   ),
                        // );
                      },
                      icon: Icon(Icons.arrow_forward_ios, color: Colors.black,)
                  ),
                  padding: EdgeInsets.only(top: 10),
                ),
              ],
            ),
          ),
          Container(
              height: 180,
              width: 400,
              color: Colors.white,
              margin: EdgeInsets.only(top: 0),
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: listModel.length,
                  itemBuilder: (context, index){

                    return Stack(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => KomikDetail(judul: listModel[index].judul, url: listModel[index].url, eps: listModel[index].eps)
                            ));
                          },
                          child: Container(
                            margin: EdgeInsets.only(left: 10,top: 10,bottom: 0,right: 10),
                            height: MediaQuery.of(context).size.height,
                            width: 225,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(image: NetworkImage(listModel[index].url), fit: BoxFit.cover)
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: EdgeInsets.only(left: 20),
                              child: Text(listModel[index].judul, style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.w500),),
                            )
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            icon: Icon(listModel[index].isFavorite ? Icons.favorite : Icons.favorite_border, color: listModel[index].isFavorite ? Colors.red : Colors.white,),
                            onPressed: (){
                              komikProvider.toggleFavoriteStatus(listModel[index]);
                            },
                          ),
                        )
                      ],
                    );
                  }
              )
          ),
        ],
      ),
    );
  }
}

class Scadule extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
    // ppake singlw scroll view
  }
}

class Favorit extends StatefulWidget {

  final List<KomikModel> models;

  Favorit({required this.models});

  @override
  State<Favorit> createState() => _FavoritState(model: models);
}

class _FavoritState extends State<Favorit> {
  final List<KomikModel> model;

  _FavoritState({required this.model});

  @override
  Widget build(BuildContext context) {
    final favoriteList = model.where((komikModel) => komikModel.isFavorite).toList();

    return Consumer<KomikProvider>(

      builder: (context, komikProvider, _) {
        final favoriteList = komikProvider.listModel.where((komikModel) => komikModel.isFavorite).toList();
        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, top: 50, bottom: 10),
                  child: Text('Favorite', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                ),
                Container(
                  height: 40,
                  //color: Colors.green,
                  margin: EdgeInsets.only(left: 10, top: 10),
                  child: Text('Daftar Favorite kamu', style: TextStyle(
                    fontSize: 23, fontWeight: FontWeight.bold, ),
                  ),
                ),
                Container(
                  height: 500,
                  width: 500,

                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: favoriteList.length,
                      itemBuilder: (context, index) {

                        return Container(
                          height: 100,
                            width: 100,
                            child: InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => KomikDetail(judul: favoriteList[index].judul, url: favoriteList[index].url, eps: favoriteList[index].eps)
                                ));
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 10,top: 10,bottom: 0,right: 10),
                                height: MediaQuery.of(context).size.height,
                                width: 225,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(image: NetworkImage(favoriteList[index].url), fit: BoxFit.cover)
                                ),
                              ),
                            )
                        );
                      }),
                )

              ],
            ),
          ),
        );
      },
    );
  }
}

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 10, top: 50, bottom: 10),
              child: Text('Ini History',style: TextStyle(fontSize: 50),),
            ),
          ],
        ),
      ),
    );
  }
}

class More extends StatefulWidget {
  @override
  State<More> createState() => _MoreState();
}

class _MoreState extends State<More> {
  static int x = pakaidiamond.diamond;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(top: 40, bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text('More', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (_) => cekLogin(),
                            ),
                          );
                        },
                        icon: Icon(Icons.account_circle, color: Colors.black45, size: 40,)),
                  ),
                ],
              )
            ),
            Container(
              height: 100,
              color: Colors.white70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      padding: EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        Icon(Icons.diamond, color: Colors.yellow, size: 30,),
                        Padding(padding: EdgeInsets.only(left: 10,)),
                        Text('$x', style: TextStyle(fontSize: 25),),
                      ],
                    )
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 8),
                    child: ElevatedButton(
                      onPressed: (){
                        setState(() {
                          x+=15;
                        });
                      },
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green),
                      ),
                      child: Text("Isi Diamond",),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      //bottomNavigationBar: NavgasiBawahBar(),
    );
  }
}

class pakaidiamond{
  static int diamond = 0;
}

class pagediamon extends StatefulWidget {
  @override
  State<pagediamon> createState() => _pagediamonState();
}

class _pagediamonState extends State<pagediamon> {
  int update = _MoreState.x;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(left: 10, top: 30, bottom: 10),
            child: IconButton(
              onPressed: (){
                Navigator.pop(context,'$update');
              },
              icon: Icon(Icons.arrow_back_sharp, size: 30,),
            ),
          ),
          Container(
            height: 100,
            color: Colors.white70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        Icon(Icons.diamond, color: Colors.yellow, size: 30,),
                        Padding(padding: EdgeInsets.only(left: 10,)),
                        Text('$update', style: TextStyle(fontSize: 25),),
                      ],
                    )
                ),
                Container(
                  margin: EdgeInsets.only(right: 8),
                  child: ElevatedButton(
                    onPressed: (){
                      if (update > 1){
                        setState(() {
                          update-=15;
                        });
                      }
                      else{
                        return null;
                      }
                    },
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.yellowAccent)),
                    child: Text('Gunakan Diamond', style: TextStyle(color: Colors.black),),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NavgasiBawahBar extends StatefulWidget {
  @override
  State<NavgasiBawahBar> createState() => _NavgasiBawahBarState();
}

class _NavgasiBawahBarState extends State<NavgasiBawahBar> {
  int currentIndex = 0;
  final screen = [
    Utama(),
    Scadule(),
    Favorit(models: listModel),
    History(),
    More(),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screen,
      ),
      bottomNavigationBar: BottomNavigationBar(
        //type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        currentIndex: currentIndex,
        iconSize: 30,
        //showSelectedLabels: false,
        onTap: (index) => setState(() => currentIndex = index) ,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.green,),
            label: 'Home',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time, color: Colors.green,),
            label: 'Scadule',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.redAccent,),
            label: 'Favorite',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history, color: Colors.green,),
            label: 'History',
            backgroundColor: Colors.white,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz, color: Colors.green,),
            label: 'More',
            backgroundColor: Colors.white,
          ),
        ],
      ),
    );
  }
}