import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
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
          children: [Text(surah.namaLatin.toString())],
        ),
      );

  AppBar _appBar({required BuildContext context, required Surah surah}) =>
      AppBar(
        title: Text(surah.nama.toString()),
        leading: IconButton(
            onPressed: (() => {Navigator.of(context).pop()}),
            icon: SvgPicture.asset('assets/svg/back_icon.svg')),
      );
}
