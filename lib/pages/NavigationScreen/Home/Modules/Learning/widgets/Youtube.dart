import 'package:app/customWidget/Appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
// import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class Youtube extends StatefulWidget {
  List videos;
  Youtube({super.key, required this.videos});

  @override
  State<Youtube> createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {
  // late YoutubePlayerController _ytbPlayerController;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // setState(() {
      //   _ytbPlayerController = YoutubePlayerController(
      //     initialVideoId: widget.videos[0],
      //     params: YoutubePlayerParams(
      //       showFullscreenButton: true,
      //       autoPlay: false,
      //     ),
      //   );
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    print(widget.videos);
    return Scaffold(
      appBar: customAppBar(const Iconify(
        MaterialSymbols.arrow_back_ios_rounded,
        color: Colors.white,
        size: 44,
      )),
      body: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          height: double.infinity,
          child: ListView.builder(
            itemCount: widget.videos.length,
            itemBuilder: (context, index) {
              return Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff201E1E),
                    boxShadow: [
                      BoxShadow(
                        color:
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 0), // changes position of shadow
                      ),
                    ],
                  ),
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ));
            },
          )),
    );
  }
}
