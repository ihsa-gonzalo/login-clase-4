import 'package:flutter/material.dart';
import 'package:flutter_login/model/user_model.dart';

class HomeScreen extends StatelessWidget {
  final user_model? miUsuario;
  final DateTime hoy = DateTime.now();

  HomeScreen({super.key, this.miUsuario});

  @override
  Widget build(BuildContext context) {
    String convertedDateTime =
        "${hoy.day.toString().padLeft(2, '0')}-${hoy.month.toString().padLeft(2, '0')}-${hoy.year.toString()}";

    return Scaffold(
        appBar: AppBar(title: const Text("Home")),
        drawer: Drawer(
            child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const MyDrawerHeader(),
            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              title: const Text("Desarrollada por: Gonzalo Benoffi"),
            ),
            const ListTile(
              title: Text("Curso Flutter UTN 2023"),
            ),
            ListTile(
              title: Text("Usuario: ${miUsuario!.username}"),
            ),
            ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.login),
              ),
              title: const Text("Salir"),
              subtitle: const Text('Presiona para salir'),
              onTap: () {
                Navigator.popAndPushNamed(context, "login");
              },
            )
          ],
        )),
        //backgroundColor: Colors.purpleAccent,
        body: Column(
          children: [
            HeaderCard(
                miUsuario: miUsuario, convertedDateTime: convertedDateTime),
            if (miUsuario!.name.isNotEmpty)
              DataCard(miUsuario!.name, Icons.person),
            if (miUsuario!.phone.isNotEmpty)
              DataCard(miUsuario!.phone, Icons.phone),
          ],
        ));
  }
}

class DataCard extends StatelessWidget {
  final String info;
  final IconData icon;
  const DataCard(this.info, this.icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4.0),
      color: Colors.blue,
      shadowColor: const Color(0xff000000),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
        side: const BorderSide(color: Color(0x4d9e9e9e), width: 1),
      ),
      child: Container(
          margin: const EdgeInsets.all(10),
          child: Row(children: [
            Icon(
              icon,
            ),
            Text(info),
          ])),
    );
  }
}

class HeaderCard extends StatelessWidget {
  const HeaderCard({
    super.key,
    required this.miUsuario,
    required this.convertedDateTime,
  });

  final user_model? miUsuario;
  final String convertedDateTime;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(4.0),
      color: Colors.blue,
      shadowColor: const Color(0xff000000),
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
        side: const BorderSide(color: Color(0x4d9e9e9e), width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: const Image(
                  fit: BoxFit.fitWidth,
                  image: NetworkImage("https://picsum.photos/250?image=9"),
                  height: 100,
                  width: 140,
                ),
              ),
            ),
          ),
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Hola ${miUsuario?.username}",
                    style: const TextStyle(color: Colors.white, fontSize: 20)),
                const SizedBox(
                  height: 10,
                ),
                Text("Hoy es $convertedDateTime", style: const TextStyle())
              ]),
        ],
      ),
    );
  }
}

class MyDrawerHeader extends StatelessWidget {
  const MyDrawerHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
        decoration: const BoxDecoration(color: Colors.blue),
        child: Center(
            child: Column(
          mainAxisSize: MainAxisSize.max,
          textBaseline: TextBaseline.alphabetic,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.all(5),
                child: Image.network(
                    height: 50,
                    width: 150,
                    fit: BoxFit.fill,
                    "https://docs.flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png"),
              ),
            ),
            Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: const Center(
                    child: Text(
                  "Bievenido",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 30),
                )))
          ],
        )));
  }
}
