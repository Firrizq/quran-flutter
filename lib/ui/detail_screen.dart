import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/model/surah.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key, required this.nomorSurah});

  final int nomorSurah;

  Future<Surah> _detailSurah() async {
    var response = await Dio().get('https://equran.id/api/surat/$nomorSurah');
    return Surah.fromJson(jsonDecode(response.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _detailSurah(),
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) {
          return Container();
        }
        // Init data from response to model
        Surah surah = snapshot.data!;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: _appBar(context: context, surah: surah),
          body: NestedScrollView(
              headerSliverBuilder: (context, innerBoxIscrolled) => [
                    SliverToBoxAdapter(
                      child: _detail(surah: surah),
                    )
                  ],
              body: Container()),
        );
      },
    );
  }

  Widget _detail({required Surah surah}) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Stack(
          children: [
            Container(
              height: 256,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFDF98FA),
                    Color(0xFF9055FF),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Opacity(
                opacity: 0.2,
                child: SvgPicture.asset(
                  'assets/svg/quran_banner.svg',
                  width: 324 - 58,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    surah.namaLatin,
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 26),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    surah.arti,
                    style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Divider(
                    color: Colors.white.withOpacity(0.35),
                    thickness: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        surah.tempatTurun.toString(),
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14),
                      ),
                      SizedBox(width: 5),
                      Container(
                        width: 4,
                        height: 4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '${surah.jumlahAyat} Ayat',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  const SizedBox(height: 38),
                  SvgPicture.asset('assets/svg/basmallah.svg'),
                ],
              ),
            ),
          ],
        ),
      );

  AppBar _appBar({required BuildContext context, required Surah surah}) =>
      AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(surah.nama.toString()),
        actions: [
          IconButton(
              onPressed: (() => {}),
              icon: SvgPicture.asset('assets/svg/search_icon.svg'))
        ],
        leading: IconButton(
            onPressed: (() => {Navigator.of(context).pop()}),
            icon: SvgPicture.asset('assets/svg/back_icon.svg')),
      );
}
