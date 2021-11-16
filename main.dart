import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gerald PlayList',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: PlayList(),
    );
  }
}

class PlayList extends StatefulWidget {
  @override
  _PlayListState createState() => _PlayListState();
}

class _PlayListState extends State<PlayList> {
  int pagAct = 0;
  final rnd = new Random();

  List<Widget> _paginas = [
    PlayList(),
    SecondPage(),
  ];

  final List<Color> colores = [
    Colors.blue.shade100,
    Colors.red.shade200,
    Colors.purple.shade100
  ];

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = List.generate(
        100,
        (i) => Container(
            width: double.infinity,
            height: 150,
            color: colores[rnd.nextInt(this.colores.length)]));

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(() {
            pagAct = index;
          });
        },
        currentIndex: pagAct,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle), label: 'Second Page')
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            floating: true,
            pinned: true,
            title: Text('Semana 10'),
            expandedHeight: 160,
            flexibleSpace: Image.network(
              'data:image/jpeg;base64,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',
              fit: BoxFit.cover,
            ),
          ),
          SliverList(delegate: SliverChildListDelegate(items))
        ],
      ),
    );
  }
}

/*class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}*/

class SecondPage extends StatelessWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Text('Text 1'),
    );
  }
}
