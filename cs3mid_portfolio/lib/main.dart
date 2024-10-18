import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  double coverHeight = 280;

  final double profileHeightRatio = 0.95;

  String descString = '';

   @override 
  void initState() { 
    super.initState(); 
    loadDesc(); 
  } 

  @override
  Widget build(BuildContext context) {
    coverHeight = (MediaQuery.of(context).size.height)*0.4;
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 254, 254, 254),
      ),
      home: Scaffold(
        body: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            topBuild(),
            profileContent(),
          ],
        ),
      ),
    );
  }

  Widget topBuild() {
    return Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: (coverHeight*profileHeightRatio)/2.5),
              child: profileCover(),
            ),
            Positioned(
              top: (coverHeight - (coverHeight*profileHeightRatio)/1.25),
              child: profilePicture()
            ),
          ],
        );
  }

  Widget profileCover() => Container(
    color: Colors.grey,
    child: Image.asset('assets/bg.png',
      width: double.infinity,
      height: coverHeight,
      fit: BoxFit.cover,
      ),
  );

   Widget profilePicture() => CircleAvatar(
    radius: ((coverHeight*profileHeightRatio)/2)+5,
    backgroundColor: Colors.grey,
    child: CircleAvatar(
      radius: (coverHeight*profileHeightRatio)/2,
      backgroundColor: Colors.grey.shade800,
      backgroundImage: const AssetImage('assets/pic.jpg'),
    ),
   );

   Widget profileContent() => Column(
    children: [
      const Text('PORTFOLIO',
        style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 15,),
      Container(
        margin: const EdgeInsets.symmetric(horizontal: 50),
        child: Text(descString, textAlign: TextAlign.center,),
      ),
      const SizedBox(height: 15,),
      const Text('READ MORE',
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, decoration: TextDecoration.underline),
      ),
    ],
   );

   Future<void> loadDesc() async {
    String fileContent = await rootBundle.loadString('assets/desc.txt');
    setState(() { 
      descString = fileContent; 
    });
  }
}