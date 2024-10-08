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
  final double mobileCoverHeight = 280;

  final double mobileProfileHeight = 280;

  final double webCoverHeight = 280;

  final double webProfileHeight = 144;

  String descString = '';

   @override 
  void initState() { 
    super.initState(); 
    loadDesc(); 
  } 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
              margin: EdgeInsets.only(bottom: mobileProfileHeight/2.5),
              child: profileCover(),
            ),
            Positioned(
              top: (mobileCoverHeight - mobileProfileHeight/1.25),
              child: profilePicture()
            ),
          ],
        );
  }

  Widget profileCover() => Container(
    color: Colors.grey,
    child: Image.asset('assets/bg.png',
      width: double.infinity,
      height: mobileCoverHeight,
      fit: BoxFit.cover,
      ),
  );

   Widget profilePicture() => CircleAvatar(
    radius: (mobileProfileHeight/2)+5,
    backgroundColor: Colors.grey,
    child: CircleAvatar(
      radius: mobileProfileHeight/2,
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


