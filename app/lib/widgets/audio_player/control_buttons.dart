import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:just_audio/just_audio.dart';

import '../../styles/dana_theme.dart';
import '../../utils/screen_size.dart';

class BackgroundImageUnit extends StatefulWidget {
  final String? image;
  final AudioPlayer player;

  BackgroundImageUnit({
    Key? key,
    required this.image,
    required this.player
  }) : super(key: key);

  @override
  _BackgroundImageUnitState createState() => _BackgroundImageUnitState();
}

class _BackgroundImageUnitState extends State<BackgroundImageUnit> {
  String? _imageUrl;

  @override
  void initState() {
    _getDownloadImageUrl(widget.image!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        width: double.infinity,
        color: DanaTheme.paletteLightGrey,
        child: Stack(children: [
          _imageUrl != null
              ? SizedBox(
                  width: getScreenWidth(context),
                  child: Opacity(
                      opacity: 0.2,
                      child: Image.network(_imageUrl!, fit: BoxFit.cover)))
              : Container(height: 10),
          Align(
              alignment: Alignment.center,
              child: _ControlButtons(player: widget.player)),

        ]));
  }

  _getDownloadImageUrl(String poster) async {
    var url =
        await FirebaseStorage.instance.refFromURL(poster).getDownloadURL();
    if (mounted) {
      setState(() {
        _imageUrl = url;
      });
    }
  }
}

class _ControlButtons extends StatelessWidget {
  const _ControlButtons({Key? key, required this.player}) : super(key: key);
  final AudioPlayer player;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 7),
      child: Container(
        height: 85,
        decoration: BoxDecoration(
          color: Colors.white, // border color
          shape: BoxShape.circle,
        ),
        child: Padding(
            padding: EdgeInsets.all(2), // border width
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                InkWell(
                  splashColor: Colors.grey, // Splash color
                  onTap: () =>
                      player.seek(player.position - Duration(seconds: 15)),
                  child: SvgPicture.asset(
                    'assets/images/time_back.svg',
                    width: 40,
                    height: 40,

                  ),
                ),
                SizedBox(width: 35),
                StreamBuilder<PlayerState>(
                  stream: player.playerStateStream,
                  builder: (context, snapshot) {
                    final playerState = snapshot.data;
                    final processingState = playerState?.processingState;
                    final playing = playerState?.playing;
                    if (processingState == ProcessingState.loading ||
                        processingState == ProcessingState.buffering) {
                      return Container(
                        margin: EdgeInsets.all(8.0),
                        width: 40.0,
                        height: 40.0,
                        child: CircularProgressIndicator(
                            color: DanaTheme.paletteDarkBlue),
                      );
                    } else if (playing != true) {
                      return IconButton(
                        icon: Icon(Icons.play_arrow),
                        iconSize: 40.0,
                        onPressed: player.play,
                      );
                    } else if (processingState != ProcessingState.completed) {
                      return IconButton(
                        icon: Icon(Icons.pause),
                        iconSize: 40.0,
                        onPressed: player.pause,
                      );
                    } else {
                      return IconButton(
                        icon: Icon(Icons.replay),
                        iconSize: 40.0,
                        onPressed: () => player.seek(Duration.zero),
                      );
                    }
                  },
                ),
                SizedBox(width: 35),
                InkWell(
                  splashColor: Colors.grey, // Splash color
                  onTap: () =>
                      player.seek(player.position + Duration(seconds: 15)),
                  child: SvgPicture.asset(
                    'assets/images/time_forward.svg',
                    width: 40,
                    height: 40,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
