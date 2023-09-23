import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peltar/view/component/button_rounded.dart';
import 'package:peltar/viewmodel/assets_viewmodel.dart';
import 'package:provider/provider.dart';

class DetailAssetScreen extends StatelessWidget {
  const DetailAssetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AssetsViewModel>(
        builder: (context, assetViewModel, child) {
          final asset = assetViewModel.asset;
          return Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Image.asset('assets/images/dummyAset.png'),
              const SizedBox(
                height: 100,
              ),
              Expanded(
                  child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Color(0xFF00337C),
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(70))),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 20,
                        left: 10,
                        child: Text(
                          asset!.namaAsset ?? '-',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 60,
                        left: 10,
                        child: Text(
                          asset.lokasi ?? '-',
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 100,
                        left: 10,
                        child: Text(
                          asset.serialnumber ?? '-',
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 200,
                        left: MediaQuery.of(context).size.width / 2 - 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ButtonRounded(
                              title: 'Inspection',
                              route: '/form-inspection',
                              id: asset.id ?? 0,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            ButtonRounded(
                                title: 'Detail',
                                route: '/detail',
                                id: asset.id ?? 0)
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )),
            ],
          );
        },
      ),
    );
  }
}
