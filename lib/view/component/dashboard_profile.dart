import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardProfile extends StatelessWidget {
  final String? name;
  final String? email;
  const DashboardProfile({Key? key, this.name, this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
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
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
            const SizedBox(
              width: 40,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Text(
                        name ?? '-',
                        maxLines: 1,
                        style: GoogleFonts.poppins(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff1E3A8A),
                        ),
                      ),
                    ),
                  ),
                  Text(
                    email ?? '-',
                    style: GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff1E3A8A),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
