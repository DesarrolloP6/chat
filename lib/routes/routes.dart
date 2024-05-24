import 'package:chat/pages/chat_page.dart';
import 'package:chat/pages/loading_page.dart';
import 'package:chat/pages/login_page.dart';
import 'package:chat/pages/register_page.dart';
import 'package:chat/pages/usuarios_page.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext) > appRoutes = {
  'usuarios': ( _ ) => const UsuariosPage(),
  'chat'    : ( _ ) => const ChatPage(),
  'loading' : ( _ ) => const LoadingPage(),
  'register': ( _ ) => const RegisterPage(),
  'login'   : ( _ ) => const LoginPage(),
};  