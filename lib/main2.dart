import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyHomePage(),
      theme: ThemeData.dark(),
    ),
  );
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final style = TextStyle(fontSize: 18);
  List<String> list = [];

  final ScrollController scrollController = ScrollController();

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
      child: ListView.builder(
        controller: scrollController,
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
                setState(
                  () {
                    Future.delayed(
                      Duration(milliseconds: 300),
                      () => scrollController.animateTo(
                          scrollController.position.minScrollExtent,
                          duration: Duration(milliseconds: 50),
                          curve: Curves.easeInOut),
                    );
                  },
                );
              },
              child: Text(
                'Start',
                style: style,
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(bottom: 15, right: 3),
            child: FlatButton(
                padding: EdgeInsets.all(14),
                color: Colors.grey[800],
                onPressed: () {
                  setState(
                    () {
                      Future.delayed(
                        Duration(milliseconds: 300),
                        () => scrollController.animateTo(
                            scrollController.position.maxScrollExtent,
                            duration: Duration(milliseconds: 50),
                            curve: Curves.easeInOut),
                      );
                    },
                  );
                },
                child: Text('End', style: style)),
          ),
        ),
      ],
    );
  }
}
