import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
                height: 40,
              ),
              Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                  ),
                  const SizedBox(
                    width: 70,
                  ),
                  Text(
                    'Detail Asset',
                    style: GoogleFonts.poppins(
                        fontSize: 25,
                        color: const Color(0xff1E3A8A),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              )),
              const SizedBox(
                height: 60,
              ),
              Container(
                width: 200.0, // Atur lebar container sesuai kebutuhan Anda
                height: 200.0, // Atur tinggi container sesuai kebutuhan Anda
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/dummyAset.png'),
                    fit: BoxFit.fill, // Mengatur BoxFit menjadi fill
                  ),
                ),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  ButtonRounded(
                    title: 'Add Inspection',
                    route: '/form-inspection',
                    id: asset?.id ?? 0,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            enableDrag: true,
                            context: context,
                            builder: (context) => Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text('Kode Asset'),
                                          Text('-'),
                                          Text(asset!.codeAsset ?? '-'),
                                        ],
                                      )
                                    ],
                                  ),
                                ));
                      },
                      child: Text('Detail')),
                  ElevatedButton(onPressed: () {}, child: Text('Inspection')),
                  ElevatedButton(onPressed: () {}, child: Text('Document')),
                ],
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
