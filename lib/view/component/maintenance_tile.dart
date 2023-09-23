import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MaintenanceTile extends StatelessWidget {
  String? namaAset;
  String? merkAset;
  String? lokasi;
  MaintenanceTile({Key? key, this.namaAset, this.merkAset, this.lokasi})
      : super(key: key);

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Text(namaAset!,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                  ))),
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Text(merkAset!,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                  ))),
          Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 2),
              child: Text(lokasi!,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                  ))),
        ],
      ),
    );
  }
}
