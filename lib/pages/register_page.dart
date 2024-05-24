
import 'package:flutter/material.dart';

import 'package:chat/witgets/btn_azul.dart';
import 'package:chat/witgets/custom_input.dart';
import 'package:chat/witgets/label_login.dart';
import 'package:chat/witgets/logo_login.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF2F2F2),
      body: Center(
        child: SingleChildScrollView(
          physics:const  BouncingScrollPhysics(),
          child:SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child:const  Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Logo(tittle: 'Registro'),
                _Form(),
                Labels(ruta: 'login',),
                Text('Terminos y condiciones de uso', style: TextStyle(fontWeight: FontWeight.w200),)
              ],
            ),
          ),
        ),
     ),
   );
  }

}

  class _Form extends StatefulWidget {  
    const _Form();

    @override
    State<_Form> createState() => __FormState();
  }
  
  class __FormState extends State<_Form> {

    final nameCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    final passCtrl = TextEditingController();
    @override
    Widget build(BuildContext context) {
      return Container(
        margin: const EdgeInsets.only(top: 40),
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: [
            // TextField(),
             CustomInput(
              icon: Icons.person_outline,
              placeHolder: 'Nombre',
              textController: nameCtrl,
              textInputTipe: TextInputType.text,

            ),
            CustomInput(
              icon: Icons.mail_outline,
              placeHolder: 'Correo',
              textController: emailCtrl,
              textInputTipe: TextInputType.emailAddress,

            ),
             CustomInput(
              icon: Icons.lock_outline,
              placeHolder: 'Contraseña',
              isPasword: true,
              textController: passCtrl,
              textInputTipe: TextInputType.text,

            ),
           ButtonAzul(
            icon: const  Icon(Icons.check_circle_outline, color: Colors.white70,),
            onPress: (){
              print(emailCtrl.text);
              print(passCtrl.text);
            },
            text: 'Ingresar',
           )
            
          ],
        ),
      );
    }
  }
