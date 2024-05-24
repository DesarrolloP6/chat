
  import 'package:flutter/material.dart';

class Labels extends StatelessWidget {
    final String ruta;

    const Labels({super.key, required this.ruta});
  
    @override
    Widget build(BuildContext context) {
      return Column(
        children: [
          Text(ruta=='register'? 'No Tienes Cuenta?':'Ya tienes cuenta?', style: const  TextStyle(color: Colors.black54, fontSize: 15,fontWeight: FontWeight.w300),),
          const SizedBox(height: 10,),
          GestureDetector(
            child: Text( ruta=='register'?'Crear una ahora!':'Ingresa ahora!', style: TextStyle(color: Colors.blue[600], fontSize: 18, fontWeight: FontWeight.bold),),
            onTap: (){
              Navigator.pushReplacementNamed(context, ruta);
            },
          )
        ],
      );
    }
  }