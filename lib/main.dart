import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final style = TextStyle(fontSize: 18);
  List<String> list = [];

  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GoToIndex( ) Test'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[buildRow(), buildExpanded()],
      ),
    );
  }

  Expanded buildExpanded() {
    list = createList();

    return Expanded(
      child: ScrollablePositionedList.builder(
        itemScrollController: itemScrollController,
        itemPositionsListener: itemPositionsListener,
        itemCount: list.length,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(6),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Cyberpunk 2077! - $index",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )),
              Image.network(list[index]),
            ],
          );
        },
      ),
    );
  }

  List<String> createList() {
    final List<String> list = [];

    list.add(
        'https://upload.wikimedia.org/wikipedia/pt/f/f7/Cyberpunk_2077_capa.png');
    list.add('https://t2.tudocdn.net/528926?w=646&h=284');
    list.add(
        'https://thumbs.dreamstime.com/z/new-york-vertical-preta-branca-constru%C3%A7%C3%A3o-do-ferro-de-passar-roupa-45486075.jpg');
    list.add(
        'https://multiversomais.com/wp-content/uploads/2020/04/Cyberpunk-2077-1.jpg');
    list.add('https://i.ytimg.com/vi/qIcTM8WXFjk/maxresdefault.jpg');
    list.add(
        'https://sm.ign.com/ign_br/screenshot/default/cyberpunk-2077-character_vrat.jpg');
    list.add(
        'https://cdn.ome.lt/4yxk10rzDGAQFrCZZ13G4MTKgwg=/970x360/smart/uploads/conteudo/fotos/cyberpunk-2077-v-mulher-header.png');

    return list;
  }

  Row buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
            child: Container(
          margin: EdgeInsets.only(bottom: 15, right: 3),
          child: FlatButton(
              padding: EdgeInsets.all(14),
              color: Colors.grey[800],
              onPressed: () {
                int index = 2;
                itemScrollController.scrollTo(
                    index: index, duration: Duration(milliseconds: 300));
              },
              child: Text(
                'Start',
                style: style,
              )),
        )),
        Expanded(
            child: Container(
          margin: EdgeInsets.only(bottom: 15, right: 3),
          child: FlatButton(
              padding: EdgeInsets.all(14),
              color: Colors.grey[800],
              onPressed: () {
                int index = list.length ~/ 2;
                itemScrollController.scrollTo(
                    index: index, duration: Duration(milliseconds: 300));
              },
              child: Text('Middle', style: style)),
        )),
        Expanded(
            child: Container(
          margin: EdgeInsets.only(bottom: 15, right: 3),
          child: FlatButton(
              padding: EdgeInsets.all(14),
              color: Colors.grey[800],
              onPressed: () {
                int index = list.length;
                itemScrollController.scrollTo(
                    index: index, duration: Duration(milliseconds: 300));
              },
              child: Text('End', style: style)),
        )),
      ],
    );
  }
}
