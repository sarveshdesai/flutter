import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';


class CameraView extends StatefulWidget {
  List<CameraDescription> cameras;
  CameraView(this.cameras);
  @override
  _CameraViewState createState() => _CameraViewState();
}

class _CameraViewState extends State<CameraView> {
  CameraController _controller;
  bool _isRecording = false;
  //final _timerKey = GlobalKey<VideoTimerState>();

  @override
  void initState(){
    super.initState();
    _controller = new CameraController(widget.cameras[0], ResolutionPreset.veryHigh);
    _controller.initialize().then((_){
      if(!mounted){
        return;
      }
      setState(() {
      });
    });
  }

  Future startVideoRecording() async{
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dir = '${extDir.path}';
    await Directory(dir).create(recursive: true);
    //final String dirPath = '${extDir.path}/media';
    //await Directory(dirPath).create(recursive: true);
    final String filePath = '$dir/${_timestamp()}.mp4';
    print(filePath);
    if(!_controller.value.isInitialized) {
      return;
    }
    setState(() {
      _isRecording = true;
    });
    try{
      await _controller.startVideoRecording(filePath);

    }on CameraException catch(e){
      return print(e);
    }
    return filePath;
  }

  Future<void> stopVideoRecording() async {
    if (!_controller.value.isRecordingVideo) {
      return null;
    }
    //_timerKey.currentState.stopTimer();
    setState(() {
      _isRecording = false;
    });

    try {
      await _controller.stopVideoRecording();
    } on CameraException catch (e) {
      //_showCameraException(e);
      return null;
    }
  }

  /*Future<void> _initCamera() async {
    widget.cameras = await availableCameras();
    _controller = CameraController(_cameras[0], ResolutionPreset.medium);
    if(!mounted){
      return;
    }
    setState(() {
    });
  }*/

  @override
  void dispose(){
    _controller?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    if(!_controller.value.isInitialized){
      return new Container();
    }
    return Container(
      child: Column(
        children: [
          Expanded(
            flex: 6,
            child: new AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: new CameraPreview(_controller),
            ),
          ),
          Expanded(
              child:Container(
                color: Colors.black,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    MaterialButton(

                      //child: Text('Emergency', style: Theme.of(context).textTheme.button.copyWith(fontSize: 15.0)),

                      shape: CircleBorder(),
                      color: Theme.of(context).buttonColor,
                      padding: EdgeInsets.all(20),
                      child: Icon(
                          (_isRecording) ? Icons.stop : Icons.videocam
                      ),
                      onPressed: ()=> {
                        if (_isRecording) {
                          stopVideoRecording(),
                        } else {
                          startVideoRecording(),
                        }
                      },


                    )
                  ],
                ),
              )
          ),
        ],
      ),
    );
  }

  /*Widget _buildCameraPreview(){
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      child: Container(
        child: Transform.scale(
          scale: _controller.value.aspectRatio,
          child: Center(
            child: AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: CameraPreview(_controller),
            ),
          ),
        ),
      ),
    );
  }*/
  String _timestamp() => DateTime.now().millisecondsSinceEpoch.toString();
}

