import 'package:chat/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class UsuariosPage extends StatefulWidget {
  


  const UsuariosPage({super.key});

  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {


  final List<Usuario> usuarios = [
    Usuario(online: true, email: 'a@gmail.com', nombre: 'Marcos', uid: 'uu-id-1'),
    Usuario(online: true, email: 'b@gmail.com', nombre: 'Juan', uid: 'uu-id-2'),
    Usuario(online: false, email: 'c@gmail.com', nombre: 'David', uid: 'uu-id-3'),
  ];
  RefreshController _refreshController = RefreshController(initialRefresh: false);
  
  @override
  Widget build(BuildContext context) {
    
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Mi nombre'),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(onPressed: (){}, icon: const Icon(Icons.exit_to_app_outlined)),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: Icon(Icons.check_circle_outline, color: Colors.blue[400],),
            // child: Icon(Icons.offline_bolt_outlined, color: Colors.red[400],),
          )
        ],
      ),
      body: Center(
        child: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          onRefresh: cargarUsuarios,
          header: WaterDropHeader(
            complete: Icon(Icons.check, color: Colors.blue[400],),
            waterDropColor: Colors.blue,
          ),
          child: _listViewUsuarios(),
        ),
     ),
   );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) => _usuarioListTitle(usuarios[index]),
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemCount: usuarios.length,);
  }

  ListTile _usuarioListTitle(Usuario usuario) {
    return ListTile(
          title: Text(usuario.nombre),
          subtitle: Text(usuario.email),
          leading:  CircleAvatar(
            child: Icon( usuario.online ? Icons.person_outline: Icons.person_off_outlined)),
        );
  }

  cargarUsuarios() async {
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }
}