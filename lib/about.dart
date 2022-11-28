
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Me',
          style: TextStyle(
            fontWeight: FontWeight.w700
          ),),
          elevation: 0.0,),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset('assets/rizal.jpg',height: 150,width: 250,)
              ),
              SizedBox(height: 20,),
              Center(child: Text('Nama : Rizal Firdaus\nNim : 21120120120031\nStatus : Mahasiswa Universitas Diponegoro',style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16
              ),))
            ]),
        ),
      )
    );
  }
}