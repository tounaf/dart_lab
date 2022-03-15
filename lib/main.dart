import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Test',
    // home: Home(),
    initialRoute: '/',
    routes: {
      '/': (context) => const Home(),
      '/detail': (context) => const Detail()
    },
  ));
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color _myColor = Colors.red;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/detail');
          },
          child: const Text('Home'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            setState(() {
              _myColor = Colors.green;
            });
        },
        backgroundColor: _myColor,
        child: Icon(Icons.add_circle),
      ),
    );
  }
}

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail'),
      ),
      body:  ListView.separated(
        itemCount: entries.length,
        itemBuilder: (BuildContext context, index) {
          return Container(
            height: 50,
            color: Colors.amber[colorCodes[index]],
            child: Center(child: Text('Entry ${entries[index]}')),
          );
        },
        padding: const EdgeInsets.all(8),
        separatorBuilder: (context, index) => const Divider(),

      )
    );
  }
}
// Center(
// child: ElevatedButton(
// onPressed: () {
// Navigator.pop(context);
// },
// child: const Text('Retour'),
// ),
// ),
