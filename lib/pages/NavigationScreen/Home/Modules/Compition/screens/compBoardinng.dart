import 'package:app/customWidget/Appbar.dart';
import 'package:app/navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';

class compBoarding extends StatelessWidget {
  const compBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(const Iconify(
        MaterialSymbols.arrow_back_ios_rounded,
        color: Colors.white,
        size: 44,
      )),
      body: Container(
        child: Center(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff1E1E1E)),
                  onPressed: () {
                    Navigation.appNavigation.currentState!
                        .pushNamed("/comp/comp");
                  },
                  child: Text("Create Compitition",
                      style: GoogleFonts.alegreyaSans(letterSpacing: 2))),
            ),
            Spacer(),
            Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff1E1E1E)),
                  onPressed: () {
                    Navigation.appNavigation.currentState!
                        .pushNamed("/comp/join");
                  },
                  child: Text("Join Compitition",
                      style: GoogleFonts.alegreyaSans(letterSpacing: 2))),
            ),
          ],
        )),
      ),
    );
  }
}
