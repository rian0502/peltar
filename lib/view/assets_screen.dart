import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../viewmodel/assets_viewmodel.dart';
import 'list_assets.dart';

class AssetsScreens extends StatefulWidget {
  const AssetsScreens({Key? key}) : super(key: key);

  @override
  State<AssetsScreens> createState() => _AssetsScreensState();
}

class _AssetsScreensState extends State<AssetsScreens> {
  @override
  void initState() {
    SharedPreferences.getInstance().then((value) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final assetViewModel = Provider.of<AssetsViewModel>(context);
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    onPressed: () {
                      context.go('/home');
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                Expanded(
                  child: Text(
                    'Asset',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color: const Color(0xff1E3A8A),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListAssets(assetsViewModel: assetViewModel),
          ),
        ],
      ),
    );
  }
}
