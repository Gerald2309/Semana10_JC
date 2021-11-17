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
    Colors.purple.shade100,
    Colors.purple.shade200,
    Colors.pink.shade300,
    Colors.green.shade100
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
              'https://www.elindependiente.com/wp-content/uploads/2020/09/pinkfloyd-1-967x808.jpg',
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
