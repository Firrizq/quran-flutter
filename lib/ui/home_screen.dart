import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quran/ui/tabs/hizb_tab.dart';
import 'package:quran/ui/tabs/page_tab.dart';
import 'package:quran/ui/tabs/para_tab.dart';
import 'package:quran/ui/tabs/surah_tab.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavigationBar(),
      body: DefaultTabController(
        length: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) => [
              SliverToBoxAdapter(
                child: _salam(),
              ),
              SliverAppBar(
                pinned: true,
                elevation: 0,
                shape: Border(
                    bottom: BorderSide(
                        width: 3,
                        color: const Color(0XFFAAAAAA).withOpacity(0.1))),
                automaticallyImplyLeading: false,
                bottom: PreferredSize(
                  preferredSize: const Size.fromHeight(0),
                  child: _tab(),
                ),
              )
            ],
            body: const TabBarView(
              children: [SurahTab(), HizbTab(), PageTab(), ParaTab()],
            ),
          ),
        ),
      ),
    );
  }

  TabBar _tab() => TabBar(
          labelColor: Colors.purple,
          indicatorColor: Colors.purple,
          indicatorWeight: 3,
          tabs: [
            _tabItem('Surah'),
            _tabItem('Hizb'),
            _tabItem('Page'),
            _tabItem('Para'),
          ]);

  Tab _tabItem(String label) => Tab(
        child: Text(
          label,
          style: GoogleFonts.plusJakartaSans(
              fontSize: 16, fontWeight: FontWeight.w600),
        ),
      );

  Column _salam() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Assalamualaikum',
            style: GoogleFonts.plusJakartaSans(
                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 24),
          ),
          const SizedBox(height: 16),
          Text(
            'Nyan',
            style: GoogleFonts.plusJakartaSans(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          const SizedBox(height: 16),
          _lastRead()
        ],
      );

  Stack _lastRead() => Stack(
        children: [
          Container(
            height: 160,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: const LinearGradient(
                    colors: [Color(0xFFDF98FA), Color(0xFF9055FF)],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
          ),
          Positioned(
              bottom: 5,
              right: 0,
              child: SvgPicture.asset('assets/svg/quran_banner.svg')),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Text(
                  'Last Read',
                  style: GoogleFonts.plusJakartaSans(
                      color: Colors.white, fontSize: 16),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text('Al-Fatihah',
                    style: GoogleFonts.plusJakartaSans(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  'Ayat Ke-1',
                  style: GoogleFonts.plusJakartaSans(
                      color: Colors.white, fontSize: 16),
                )
              ],
            ),
          ),
        ],
      );

  BottomNavigationBar _bottomNavigationBar() => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          items: [
            _bottomNavigationBarItem(
                icon: 'assets/svg/quran_icon.svg', label: 'Quran'),
            _bottomNavigationBarItem(
                icon: 'assets/svg/doa_icon.svg', label: 'Doa'),
            _bottomNavigationBarItem(
                icon: 'assets/svg/bookmark_icon.svg', label: 'Bookmark')
          ]);

  BottomNavigationBarItem _bottomNavigationBarItem(
          {required String icon, required String label}) =>
      BottomNavigationBarItem(
          icon: SvgPicture.asset(icon),
          activeIcon: SvgPicture.asset(icon),
          label: label);

  AppBar _appBar() => AppBar(
        title: Row(
          children: [
            SvgPicture.asset('assets/svg/quran_icon.svg'),
            const SizedBox(width: 18),
            Text(
              'Quran App',
              style: GoogleFonts.plusJakartaSans(
                  color: Colors.purple,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: (() => {}),
              icon: SvgPicture.asset('assets/svg/search_icon.svg'))
        ],
      );
}
