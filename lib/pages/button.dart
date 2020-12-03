import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rescue/pages/camera.dart';


class Buttonns extends StatefulWidget {
  final cameras;
  Buttonns(this.cameras);
  @override
  _ButtonnsState createState() => _ButtonnsState();
}

class _ButtonnsState extends State<Buttonns> {

  String filePath = 'police_siren.mp3';
  AudioCache audioCache = AudioCache();
  AudioPlayer audioPlayer = AudioPlayer();
  playLocal() async {
    audioCache.play(filePath);
  }
  @override
  Widget build(BuildContext context) {
    Key ok = ValueKey("1");
    return Scaffold(
      body: SafeArea(
        child: ReorderableListView(
          children: <Widget>[
            Padding(
              key: ValueKey("1"),
              padding: const EdgeInsets.only(top: 16),
              child: Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: InkResponse(
                      containedInkWell: true,
                      onTap: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CameraView(widget.cameras)),
                        ),
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ListTile(

                          leading: Icon(Icons.camera),
                          title: Text("Record", style: new TextStyle(color: Theme.of(context).accentColor)),
                          subtitle:  Text("record a suspicious person or an attacker safely"),
                        ),
                      )
                  )
              )
            ),
            Padding(
                key: ValueKey("2"),
                padding: const EdgeInsets.only(top: 16),
                child: Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: InkResponse(
                        containedInkWell: true,
                        onTap: () => {
                          playLocal(),
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: ListTile(
                            leading: Icon(Icons.call),
                            title: Text("Buzzer", style: new TextStyle(color: Theme.of(context).accentColor)),
                            subtitle:  Text("Siren to scare the attacker away"),
                          ),
                        )))
            ),

          ],
          onReorder: (oldindex, newindex){
            setState(() {
              if(newindex>oldindex){
                newindex-=1;
              }
            });
          },
        ),
      )

    );
  }
}