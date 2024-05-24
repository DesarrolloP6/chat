import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
    
    final String tittle;
    
    const Logo({super.key, required this.tittle});
  
    @override
    Widget build(BuildContext context) {
      return  Center(
        child:  Container(
          padding: const EdgeInsets.only(top: 40),
          width: 160,
          child:  Column(
            children:  [
              const Image(image: AssetImage('assets/LOGOPOS.png')),
              const SizedBox(height: 20,),
              Text(tittle, style: const TextStyle(fontSize: 30),)
            ],
          ),
        ),
      );
    }
  }