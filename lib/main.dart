import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(NamesApp());

class NamesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Names list',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Names list'),
        ),
        body: _NamesWidget()
      )
    );
  }
}

class _NamesWidget extends StatefulWidget {
  @override
  _NamesWidgetState createState() => new _NamesWidgetState();
}

class _NamesWidgetState extends State<_NamesWidget> {
  final _namesList = <WordPair>[];

  @override
  Widget build(BuildContext buildContext) {
    return _buildNamesList();
  }

  Widget _buildNamesList() {
    return ListView.builder(
      itemBuilder: (buildContext, i) {
        if (i.isOdd) {
          return Divider();
        }

        final index = i ~/ 2;

        if (index >= _namesList.length) {
          final wordPairs = generateWordPairs().take(10);
          _namesList.addAll(wordPairs);
        }

        return _buildListItem(_namesList[index]);
      }
    );
  }

  Widget _buildListItem(WordPair wordPair) {
    return ListTile(
      title: Text(wordPair.asPascalCase),
    );
  }
}