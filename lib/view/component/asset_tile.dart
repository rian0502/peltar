import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/assets.dart';

class AssetTile extends StatelessWidget {
  Asset? asset;
  AssetTile({Key? key, this.asset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 9), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Text(asset!.namaAsset!,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                  ))),
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Text(asset!.merk!,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                  ))),
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 2),
              child: Text(asset!.lokasi!,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                  ))),
        ],
      ),
    );
  }
}
