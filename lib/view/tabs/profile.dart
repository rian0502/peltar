import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../viewmodel/login_viewmodel.dart';
import '../component/dashboard_profile.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 20,
        ),
        Center(
          child: Text(
            'Profile',
            style: GoogleFonts.poppins(
                fontSize: 25,
                color: const Color(0xff1E3A8A),
                fontWeight: FontWeight.w600),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Account',
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: const Color(0xff1E3A8A),
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: FutureBuilder(
              builder: (context, AsyncSnapshot<Map<String, String>> snapshot) {
                if (snapshot.hasData) {
                  return DashboardProfile(
                    name: snapshot.data!['nama'],
                    email: snapshot.data!['email'],
                  );
                } else {
                  return const CircularProgressIndicator();
                }
              },
              future: _getUserName()),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('About',
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: const Color(0xff1E3A8A),
                      fontWeight: FontWeight.w600)),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 1,
                  color: Colors.grey,
                  blurRadius: 1,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'App Version',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF134A6E),
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '1.1.1',
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Help',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF134A6E),
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'www.ptbatarahan.co.id',
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 1,
                  color: Colors.grey,
                  blurRadius: 1,
                  offset: Offset(0, 1), // changes position of shadow
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Agus Sunyoto\nAdi Ersalado',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF134A6E),
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        'Product Manager',
                        style: GoogleFonts.poppins(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Aninda A Andiani',
                        style: GoogleFonts.poppins(
                          color: Color(0xFF134A6E),
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      Text('Designer',
                          style: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Muhammad Febrian H\nMuhammad Wirasena',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF134A6E),
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      Text('Front End Developer',
                          style: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Tomi Andreansyah',
                        style: GoogleFonts.poppins(
                          color: const Color(0xFF134A6E),
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                      Text('Back End Developer',
                          style: GoogleFonts.poppins(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 10,
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  Provider.of<LoginViewModel>(context, listen: false)
                      .logout(context)
                      .then((value) {
                    context.go('/login');
                  });
                },
                child: const Text('Logout'),
              )
            ],
          ),
        )
      ],
    );
  }

  Future<Map<String, String>> _getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? nama = prefs.getString('nama');
    final String? email = prefs.getString('email');
    return {
      'nama': nama!,
      'email': email!,
    };
  }
}
