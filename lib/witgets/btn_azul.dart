import 'package:flutter/material.dart';

class ButtonAzul extends StatelessWidget {
  const ButtonAzul({super.key,  required this.text, required this.onPress, required this.icon});
  final String text;
  final Icon icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Container(           
              width: double.infinity,   
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.blue,
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    blurRadius: 5,
                    color: Colors.black,
                    blurStyle: BlurStyle.solid,
                  )
                ]
              ),
              child: TextButton.icon(
                onPressed: () => onPress(),
                icon: icon,
                label: Text(text , style: const TextStyle(color: Colors.white),),
                
              ),
            );
  }
}