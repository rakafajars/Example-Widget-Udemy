import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyItem {
  bool isExpanded;
  final String header;
  final Widget body;

  MyItem(
    this.isExpanded,
    this.header,
    this.body,
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<MyItem> _items = List<MyItem>();

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 10; i++) {
      _items.add(
        MyItem(
          false,
          "Item $i",
          Container(
            padding: EdgeInsets.all(
              10.0,
            ),
            child: Text("Helo Raka"),
          ),
        ),
      );
    }
  }

  ExpansionPanel _createExpansion(MyItem items) {
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return Container(
          padding: EdgeInsets.all(
            5.0,
          ),
          child: Text(
            'Header ${items.header}',
          ),
        );
      },
      body: items.body,
      isExpanded: items.isExpanded,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expansion Tile"),
      ),
      body: Container(
        padding: EdgeInsets.all(
          32.0,
        ),
        child: ListView(
          children: <Widget>[
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(
                  () {
                    _items[index].isExpanded = !_items[index].isExpanded;
                  },
                );
              },
              children: _items.map(_createExpansion).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
