import 'package:meta/meta.dart';
import 'dart:convert';
import 'package:quran/model/ayah.dart';

List<Surah> surahFromJson(String str) => List<Surah>.from(json.decode(str).map((x) => Surah.fromJson(x)));

class Surah {
  int nomor;
  String nama;
  String namaLatin;
  int jumlahAyat;
  String tempatTurun;
  String arti;
  String deskripsi;
  String audio;
  List<Ayat>? ayat;

  Surah({
    required this.nomor,
    required this.nama,
    required this.namaLatin,
    required this.jumlahAyat,
    required this.tempatTurun,
    required this.arti,
    required this.deskripsi,
    required this.audio,
    this.ayat,
  });

  //GET data from json to class Surah
  factory Surah.fromJson(Map<String, dynamic> json) => Surah(
      nomor: json['nomor'],
      nama: json['nama'],
      namaLatin: json['nama_latin'],
      jumlahAyat: json['jumlah_ayat'],
      tempatTurun: json['tempat_turun'],
      arti: json['arti'],
      deskripsi: json['deskripsi'],
      audio: json['audio'],
      ayat: json.containsKey('ayat')?
      List<Ayat>.from(json['ayat'].map((x) => Ayat.fromJson(x))): null
      );

  Map<String, dynamic> toJson() => {
        'nomor': nomor,
        'nama': nama,
        'nama_latin': namaLatin,
        'jumlah_ayat': jumlahAyat,
        'tempat_turun': tempatTurun,
        'arti': arti,
        'deskripsi': deskripsi,
        'audio': audio,
      };
}

// Use the code below if you want to use enum class to display in the listSurah ui

// enum TempatTurun { MADINAH, MAKKAH }

// final tempatTurunValues =
//     EnumValues({'madinah': TempatTurun.MADINAH, 'mekah': TempatTurun.MAKKAH});

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((key, value) => MapEntry(value, key));
//     return reverseMap;
//   }
// }
