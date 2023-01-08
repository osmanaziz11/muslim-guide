import 'package:app/customWidget/Appbar.dart';
import 'package:app/customWidget/CircularLoader.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class Youtube extends StatefulWidget {
  List videos;
  Youtube({super.key, required this.videos});

  @override
  State<Youtube> createState() => _YoutubeState();
}

class _YoutubeState extends State<Youtube> {
  bool Loading = false;
  final List thumbnail = [
    'm1.jpg',
    'm2.jpg',
    'm3.jpg',
    'm4.jpg',
    'm5.jpg',
    'm6.jpg',
    'm7.jpg',
    'm8.jpg',
    'm9.jpg',
    'm10.jpg'
        'm1.jpg',
    'm2.jpg',
    'm3.jpg',
    'm4.jpg',
    'm5.jpg',
    'm6.jpg',
    'm7.jpg',
    'm8.jpg',
    'm9.jpg',
    'm10.jpg'
  ];
  @override
  void initState() {
    super.initState();
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
                  height: 200,
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        opacity: 0.5,
                        image: AssetImage("assets/images/${thumbnail[index]}")),
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
                  child: Center(
                    child: (Loading)
                        ? const CircularProgressIndicator()
                        : InkWell(
                            onTap: () => setState(() {
                              print(index);
                            }),
                            child: Container(
                              height: 40,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                // color: const Color.fromARGB(255, 238, 237, 237),
                              ),
                              child: Image.asset('assets/images/yt.png',
                                  width: 150, height: 50),
                            ),
                          ),
                  ));
            },
          )),
    );
  }
}
