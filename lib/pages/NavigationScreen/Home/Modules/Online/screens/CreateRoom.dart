import 'package:app/customWidget/MainHeading.dart';
import 'package:app/navigation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateRoom extends StatefulWidget {
  const CreateRoom({super.key});

  @override
  State<CreateRoom> createState() => _CreateRoomState();
}

class _CreateRoomState extends State<CreateRoom> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 500,
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Column(
          children: [
            MainHeading("Room id: E3434F3"),
            SizedBox(
              height: 10,
            ),
            Text(
              'Invite Participant',
              style: GoogleFonts.alegreyaSans(
                  color: const Color(0xFF5A5A5A), fontSize: 20),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: TextFormField(
                validator: (value) {
                  if (value == '') {
                    return 'Email is required';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {},
                key: const Key("email"),
                style: const TextStyle(color: Colors.white),
                cursorColor: const Color(0xFFBEC2C2),
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    color: Color(0xFFBEC2C2),
                  ),
                  hintText: "Email Address",
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xFFBEC2C2)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Color(0xFFBEC2C2)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 380,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/avatar1.png"),
                      ),
                      title: Text(
                        'Osman',
                        style: GoogleFonts.alegreyaSans(
                            color: Color.fromARGB(255, 211, 208, 208),
                            fontSize: 20),
                      ),
                      subtitle: Text(
                        'osmanaziz012',
                        style: GoogleFonts.alegreyaSans(
                            color: const Color(0xFF5A5A5A), fontSize: 16),
                      ),
                      trailing: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: () {},
                            child: Text("Invite",
                                style: GoogleFonts.alegreyaSans(
                                    letterSpacing: 2))),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/avatar1.png"),
                      ),
                      title: Text(
                        'Osman',
                        style: GoogleFonts.alegreyaSans(
                            color: Color.fromARGB(255, 211, 208, 208),
                            fontSize: 20),
                      ),
                      subtitle: Text(
                        'osmanaziz012',
                        style: GoogleFonts.alegreyaSans(
                            color: const Color(0xFF5A5A5A), fontSize: 16),
                      ),
                      trailing: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: () {},
                            child: Text("Invite",
                                style: GoogleFonts.alegreyaSans(
                                    letterSpacing: 2))),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/avatar1.png"),
                      ),
                      title: Text(
                        'Osman',
                        style: GoogleFonts.alegreyaSans(
                            color: Color.fromARGB(255, 211, 208, 208),
                            fontSize: 20),
                      ),
                      subtitle: Text(
                        'osmanaziz012',
                        style: GoogleFonts.alegreyaSans(
                            color: const Color(0xFF5A5A5A), fontSize: 16),
                      ),
                      trailing: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: () {},
                            child: Text("Invite",
                                style: GoogleFonts.alegreyaSans(
                                    letterSpacing: 2))),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/avatar1.png"),
                      ),
                      title: Text(
                        'Osman',
                        style: GoogleFonts.alegreyaSans(
                            color: Color.fromARGB(255, 211, 208, 208),
                            fontSize: 20),
                      ),
                      subtitle: Text(
                        'osmanaziz012',
                        style: GoogleFonts.alegreyaSans(
                            color: const Color(0xFF5A5A5A), fontSize: 16),
                      ),
                      trailing: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: () {},
                            child: Text("Invite",
                                style: GoogleFonts.alegreyaSans(
                                    letterSpacing: 2))),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/avatar1.png"),
                      ),
                      title: Text(
                        'Osman',
                        style: GoogleFonts.alegreyaSans(
                            color: Color.fromARGB(255, 211, 208, 208),
                            fontSize: 20),
                      ),
                      subtitle: Text(
                        'osmanaziz012',
                        style: GoogleFonts.alegreyaSans(
                            color: const Color(0xFF5A5A5A), fontSize: 16),
                      ),
                      trailing: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: () {},
                            child: Text("Invite",
                                style: GoogleFonts.alegreyaSans(
                                    letterSpacing: 2))),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/avatar1.png"),
                      ),
                      title: Text(
                        'Osman',
                        style: GoogleFonts.alegreyaSans(
                            color: Color.fromARGB(255, 211, 208, 208),
                            fontSize: 20),
                      ),
                      subtitle: Text(
                        'osmanaziz012',
                        style: GoogleFonts.alegreyaSans(
                            color: const Color(0xFF5A5A5A), fontSize: 16),
                      ),
                      trailing: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: () {},
                            child: Text("Invite",
                                style: GoogleFonts.alegreyaSans(
                                    letterSpacing: 2))),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/avatar1.png"),
                      ),
                      title: Text(
                        'Osman',
                        style: GoogleFonts.alegreyaSans(
                            color: Color.fromARGB(255, 211, 208, 208),
                            fontSize: 20),
                      ),
                      subtitle: Text(
                        'osmanaziz012',
                        style: GoogleFonts.alegreyaSans(
                            color: const Color(0xFF5A5A5A), fontSize: 16),
                      ),
                      trailing: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: () {},
                            child: Text("Invite",
                                style: GoogleFonts.alegreyaSans(
                                    letterSpacing: 2))),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/avatar1.png"),
                      ),
                      title: Text(
                        'Osman',
                        style: GoogleFonts.alegreyaSans(
                            color: Color.fromARGB(255, 211, 208, 208),
                            fontSize: 20),
                      ),
                      subtitle: Text(
                        'osmanaziz012',
                        style: GoogleFonts.alegreyaSans(
                            color: const Color(0xFF5A5A5A), fontSize: 16),
                      ),
                      trailing: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: () {},
                            child: Text("Invite",
                                style: GoogleFonts.alegreyaSans(
                                    letterSpacing: 2))),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/avatar1.png"),
                      ),
                      title: Text(
                        'Osman',
                        style: GoogleFonts.alegreyaSans(
                            color: Color.fromARGB(255, 211, 208, 208),
                            fontSize: 20),
                      ),
                      subtitle: Text(
                        'osmanaziz012',
                        style: GoogleFonts.alegreyaSans(
                            color: const Color(0xFF5A5A5A), fontSize: 16),
                      ),
                      trailing: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: () {},
                            child: Text("Invite",
                                style: GoogleFonts.alegreyaSans(
                                    letterSpacing: 2))),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/avatar1.png"),
                      ),
                      title: Text(
                        'Osman',
                        style: GoogleFonts.alegreyaSans(
                            color: Color.fromARGB(255, 211, 208, 208),
                            fontSize: 20),
                      ),
                      subtitle: Text(
                        'osmanaziz012',
                        style: GoogleFonts.alegreyaSans(
                            color: const Color(0xFF5A5A5A), fontSize: 16),
                      ),
                      trailing: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: () {},
                            child: Text("Invite",
                                style: GoogleFonts.alegreyaSans(
                                    letterSpacing: 2))),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/avatar1.png"),
                      ),
                      title: Text(
                        'Osman',
                        style: GoogleFonts.alegreyaSans(
                            color: Color.fromARGB(255, 211, 208, 208),
                            fontSize: 20),
                      ),
                      subtitle: Text(
                        'osmanaziz012',
                        style: GoogleFonts.alegreyaSans(
                            color: const Color(0xFF5A5A5A), fontSize: 16),
                      ),
                      trailing: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: () {},
                            child: Text("Invite",
                                style: GoogleFonts.alegreyaSans(
                                    letterSpacing: 2))),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/avatar1.png"),
                      ),
                      title: Text(
                        'Osman',
                        style: GoogleFonts.alegreyaSans(
                            color: Color.fromARGB(255, 211, 208, 208),
                            fontSize: 20),
                      ),
                      subtitle: Text(
                        'osmanaziz012',
                        style: GoogleFonts.alegreyaSans(
                            color: const Color(0xFF5A5A5A), fontSize: 16),
                      ),
                      trailing: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: () {},
                            child: Text("Invite",
                                style: GoogleFonts.alegreyaSans(
                                    letterSpacing: 2))),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/avatar1.png"),
                      ),
                      title: Text(
                        'Osman',
                        style: GoogleFonts.alegreyaSans(
                            color: Color.fromARGB(255, 211, 208, 208),
                            fontSize: 20),
                      ),
                      subtitle: Text(
                        'osmanaziz012',
                        style: GoogleFonts.alegreyaSans(
                            color: const Color(0xFF5A5A5A), fontSize: 16),
                      ),
                      trailing: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: () {},
                            child: Text("Invite",
                                style: GoogleFonts.alegreyaSans(
                                    letterSpacing: 2))),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/avatar1.png"),
                      ),
                      title: Text(
                        'Osman',
                        style: GoogleFonts.alegreyaSans(
                            color: Color.fromARGB(255, 211, 208, 208),
                            fontSize: 20),
                      ),
                      subtitle: Text(
                        'osmanaziz012',
                        style: GoogleFonts.alegreyaSans(
                            color: const Color(0xFF5A5A5A), fontSize: 16),
                      ),
                      trailing: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: () {},
                            child: Text("Invite",
                                style: GoogleFonts.alegreyaSans(
                                    letterSpacing: 2))),
                      ),
                    ),
                    ListTile(
                      onTap: () {},
                      leading: CircleAvatar(
                        backgroundImage:
                            AssetImage("assets/images/avatar1.png"),
                      ),
                      title: Text(
                        'Osman',
                        style: GoogleFonts.alegreyaSans(
                            color: Color.fromARGB(255, 211, 208, 208),
                            fontSize: 20),
                      ),
                      subtitle: Text(
                        'osmanaziz012',
                        style: GoogleFonts.alegreyaSans(
                            color: const Color(0xFF5A5A5A), fontSize: 16),
                      ),
                      trailing: Container(
                        height: 40,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            onPressed: () {},
                            child: Text("Invite",
                                style: GoogleFonts.alegreyaSans(
                                    letterSpacing: 2))),
                      ),
                    ),
                  ],
                ),
              ),
            )
            // StreamBuilder(
            //     // stream: FirebaseFirestore.instance
            //     //     .collection("users")
            //     //     .where("email", isNotEqualTo: "uz@gmail.com")
            //     //     .where("email", isNotEqualTo: "uz@gmail.com")
            //     //     .snapshots(),
            //     builder: (context, snapshot) {
            //   if (snapshot.connectionState == ConnectionState.active) {
            //     if (snapshot.hasData) {
            //       QuerySnapshot dataSnapshot = snapshot.data as QuerySnapshot;

            //       if (dataSnapshot.docs.length > 0) {
            //         Map<String, dynamic> userMap =
            //             dataSnapshot.docs[0].data() as Map<String, dynamic>;

            //         // UserModel searchedUser = UserModel.fromMap(userMap);

            //         return ListTile(
            //           onTap: () {},
            //           leading: CircleAvatar(
            //             backgroundImage:
            //                 AssetImage("assets/images/avatar1.png"),
            //           ),
            //           title: Text("Usman"),
            //           subtitle: Text("osmanaziz12"),
            //           trailing: Icon(Icons.request_page),
            //         );
            //       } else {
            //         return Text("No results found!");
            //       }
            //     } else if (snapshot.hasError) {
            //       return Text("An error occured!");
            //     } else {
            //       return Text("No results found!");
            //     }
            //   } else {
            //     return CircularProgressIndicator();
            //   }
            // })
            ,
            Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    Navigation.appNavigation.currentState!
                        .pushNamed("/Online/createroom/quizroom");
                  },
                  child: Text("Start",
                      style: GoogleFonts.alegreyaSans(letterSpacing: 2))),
            ),
          ],
        ));
  }
}
