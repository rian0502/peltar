import 'dart:io';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:peltar/viewmodel/form_inspection_viewmodel.dart';
import 'package:provider/provider.dart';

class FormInspectionScreen extends StatelessWidget {
  const FormInspectionScreen({super.key, required this.id});
  final int id;
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<FormInspectionViewModel>(context);
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  viewModel.clearForm();
                  context.pop();
                },
                icon: const Icon(Icons.arrow_back),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 8,
              ),
              Text(
                'Form Inspection',
                style: GoogleFonts.poppins(
                    fontSize: 25,
                    color: const Color(0xff1E3A8A),
                    fontWeight: FontWeight.w600),
              ),
            ],
          )),
          Padding(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 40),
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'CODE ASSET',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  initialValue: id.toString(),
                  enabled: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: viewModel.descriptionController,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    labelText: 'Deskripsi',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(12.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xff1E3A8A)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Radio<String>(
                              value: 'Breakdown',
                              groupValue: viewModel.typeInspection,
                              onChanged: (value) {
                                viewModel.setTypeInspection(value!);
                              },
                            ),
                            Text(
                              'Inspection',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: const Color(0xff1E3A8A),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Radio<String>(
                              value: 'Inspection',
                              groupValue: viewModel.typeInspection,
                              onChanged: (value) {
                                viewModel.setTypeInspection(value!);
                              },
                            ),
                            Text(
                              'Breakdown',
                              style: GoogleFonts.poppins(
                                fontSize: 15,
                                color: const Color(0xff1E3A8A),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    await viewModel.uploadImage();
                  },
                  child: Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                      color: const Color(0xff1E3A8A),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5), // Warna bayangan
                          spreadRadius: 2, // Menyebar bayangan
                          blurRadius: 5, // Tingkat kabur bayangan
                          offset: const Offset(0, 3), // Posisi bayangan (x, y)
                        ),
                      ],
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: viewModel.image.toString().isEmpty
                        ? const Icon(
                            Icons
                                .cloud_upload, // Icon untuk tombol unggah gambar
                            size: 80,
                            color: Colors.white, // Warna ikon
                          )
                        : Image.file(
                            File(viewModel.image.toString()),
                            fit: BoxFit.fill,
                          ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (viewModel.validate()) {
                          viewModel.simpan();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(viewModel.error),
                            ),
                          );
                        }
                      },
                      child: const Text('Simpan'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
