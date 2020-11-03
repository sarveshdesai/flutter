import 'package:flutter/material.dart';

class CardList extends StatefulWidget {

  final Widget child;

  CardList({Key key, @required this.child}) : super(key : key);

  @override
  _CardListState createState() => _CardListState();
}

class _CardListState extends State<CardList> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
          Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.symmetric(horizontal: 20),
            child: InkResponse(
              containedInkWell: true,
              onTap: ()=> {
                print("okay"),
              },
              child: Container(
                child: widget.child,
              ),
            )
          )
      ]);
  }
}
