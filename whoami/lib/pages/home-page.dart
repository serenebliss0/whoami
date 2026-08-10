import 'package:flutter/material.dart';
import 'package:whoami/util/function/open-webpage.dart';
import 'package:whoami/util/glass-navbar.dart';
import 'package:whoami/sections/home-section.dart';
import 'package:whoami/util/function/open-webpage.dart';
import 'package:whoami/util/glass-navbar.dart';
import 'package:whoami/sections/terminal-section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // one key per section so we can scroll to it
  final _whoamiKey = GlobalKey();
  final _aboutKey = GlobalKey();
  final _projectsKey = GlobalKey();
  final _musicKey = GlobalKey();
  final _terminalKey = GlobalKey();

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // background
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/gradient-bg.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // scrollable page content
          SingleChildScrollView(
            // padding: const EdgeInsets.only(top: 100), // room for floating navbar
            child: Column(
              children: [
                Container(key: _whoamiKey, child: const HeroSection()),
                // Container(key: _aboutKey, child: const AboutSection()),
                // Container(key: _projectsKey, child: const ProjectsSection()),
                // Container(key: _musicKey, child: const MusicSection()),
                SizedBox(width: 910,  child: Container(key: _terminalKey, child: const TerminalSection())),
                const SizedBox(height: 60),
              ],
            ),
          ),

          // floating nav bar on top
          // GlassNav()
          // Positioned(
          //   top: 24,
          //   left: 0,
          //   right: 0,
          //   child: Center(
          //     child: GlassNavbar(
          //       onWhoamiTap: () => _scrollTo(_whoamiKey),
          //       onAboutTap: () => _scrollTo(_aboutKey),
          //       onProjectsTap: () => _scrollTo(_projectsKey),
          //       onMusicTap: () => _scrollTo(_musicKey),
          //       onTerminalTap: () => _scrollTo(_terminalKey),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}