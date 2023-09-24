import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peltar/viewmodel/login_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../component/carousel_slidder.dart';
import '../component/menuAsset.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              Color(0xFF134A6E),
              Color(0xFF0093AD),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17, right: 17, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/logo.png', height: 80, width: 80),
                  IconButton(
                      onPressed: () {
                        Provider.of<LoginViewModel>(context, listen: false)
                            .logout(context)
                            .then((value) {
                          context.go('/login');
                        });
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 20,
                ),
                FutureBuilder(
                    future: _getUserName(),
                    builder:
                        (context, AsyncSnapshot<Map<String, String>> snapshot) {
                      if (snapshot.hasData) {
                        return Text('Hello, ${snapshot.data!['nama']!}!',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ));
                      } else {
                        return const CircularProgressIndicator();
                      }
                    })
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                  ),
                ),
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    MyCarouselSlidder(),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        Text(
                          'We Care about our assets. Mypeltar.',
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF0093AD),
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            MenuAsset(
                                image: 'assets/images/assets.png',
                                route: 'assets',
                                title: 'IT'),
                            MenuAsset(
                                image: 'assets/images/assets.png',
                                route: 'assets',
                                title: 'Listrik'),
                            MenuAsset(
                                image: 'assets/images/assets.png',
                                route: 'assets',
                                title: 'Mesin'),
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const MenuAsset(
                                image: 'assets/images/assets.png',
                                route: 'assets',
                                title: 'Bengkel'),
                            const MenuAsset(
                                image: 'assets/images/assets.png',
                                route: 'assets',
                                title: 'Gudang'),
                            Container(
                              height: 100,
                              width: 90,
                              decoration: BoxDecoration(
                                color: const Color(0xFF134A6E),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(20)),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(0xFF134A6E)
                                        .withOpacity(0.3),
                                    spreadRadius: 3,
                                    blurRadius: 5,
                                    offset: const Offset(
                                        0, 5), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: InkWell(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (BuildContext context) {
                                      return SingleChildScrollView(
                                        child: Container(
                                          padding: EdgeInsets.all(16.0),
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  MenuAsset(
                                                    image:
                                                        'assets/images/assets.png',
                                                    route: 'assets',
                                                    title: 'IT',
                                                  ),
                                                  MenuAsset(
                                                    image:
                                                        'assets/images/assets.png',
                                                    route: 'assets',
                                                    title: 'Listrik',
                                                  ),
                                                  MenuAsset(
                                                    image:
                                                        'assets/images/assets.png',
                                                    route: 'assets',
                                                    title: 'Mesin',
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  MenuAsset(
                                                    image:
                                                        'assets/images/assets.png',
                                                    route: 'assets',
                                                    title: 'IT',
                                                  ),
                                                  MenuAsset(
                                                    image:
                                                        'assets/images/assets.png',
                                                    route: 'assets',
                                                    title: 'Listrik',
                                                  ),
                                                  MenuAsset(
                                                    image:
                                                        'assets/images/assets.png',
                                                    route: 'assets',
                                                    title: 'Mesin',
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  MenuAsset(
                                                    image:
                                                        'assets/images/assets.png',
                                                    route: 'assets',
                                                    title: 'IT',
                                                  ),
                                                  MenuAsset(
                                                    image:
                                                        'assets/images/assets.png',
                                                    route: 'assets',
                                                    title: 'Listrik',
                                                  ),
                                                  MenuAsset(
                                                    image:
                                                        'assets/images/assets.png',
                                                    route: 'i',
                                                    title: 'Mesin',
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: const [
                                                  MenuAsset(
                                                    image:
                                                        'assets/images/assets.png',
                                                    route: 'i',
                                                    title: 'IT',
                                                  ),
                                                  MenuAsset(
                                                    image:
                                                        'assets/images/assets.png',
                                                    route: 'i',
                                                    title: 'Listrik',
                                                  ),
                                                  MenuAsset(
                                                    image:
                                                        'assets/images/assets.png',
                                                    route: 'i',
                                                    title: 'Mesin',
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      'assets/images/more.png',
                                      height: 40,
                                      width: 40,
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'More',
                                      style: GoogleFonts.poppins(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Future<Map<String, String>> _getUserName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? nama = prefs.getString('nama');
    return {
      'nama': nama!,
    };
  }
}
