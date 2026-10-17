import 'package:flutter/material.dart';
import 'package:whoami/sections/profile-sections.dart';
import 'package:whoami/sections/terminal-section.dart';
import 'package:whoami/util/glass-navbar.dart';
import 'package:whoami/util/profile-widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final Map<String, GlobalKey> _sectionKeys = {
    for (final id in _sectionOrder) id: GlobalKey(debugLabel: id),
  };
  final Set<String> _revealedSections = {'home'};
  String _activeSection = 'home';

  static const _sectionOrder = [
    'home', 'about', 'projects', 'currently', 'music', 'facts', 'diary', 'terminal',
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateScrollState);
    WidgetsBinding.instance.addPostFrameCallback((_) => _updateScrollState());
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_updateScrollState)
      ..dispose();
    super.dispose();
  }

  void _updateScrollState() {
    if (!mounted) return;
    final height = MediaQuery.sizeOf(context).height;
    String active = 'home';
    final newlyVisible = <String>[];

    for (final id in _sectionOrder) {
      final renderObject = _sectionKeys[id]?.currentContext?.findRenderObject();
      if (renderObject is! RenderBox || !renderObject.hasSize) continue;
      final top = renderObject.localToGlobal(Offset.zero).dy;
      final bottom = top + renderObject.size.height;
      if (top <= 155) active = id == 'facts' ? 'music' : id;
      if (top < height * .92 && bottom > 0 && !_revealedSections.contains(id)) {
        newlyVisible.add(id);
      }
    }

    if (active != _activeSection || newlyVisible.isNotEmpty) {
      setState(() {
        _activeSection = active;
        _revealedSections.addAll(newlyVisible);
      });
    }
  }

  Future<void> _scrollTo(String section) async {
    final target = section == 'diary' ? 'diary' : section;
    final context = _sectionKeys[target]?.currentContext;
    if (context == null) return;
    setState(() => _activeSection = section);
    final renderObject = context.findRenderObject();
    if (renderObject is! RenderBox || !_scrollController.hasClients) return;
    final top = renderObject.localToGlobal(Offset.zero).dy;
    final breathingRoom = section == 'home' ? 0.0 : 22.0;
    final targetOffset = (_scrollController.offset + top - breathingRoom)
        .clamp(0.0, _scrollController.position.maxScrollExtent);
    await _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 650),
      curve: Curves.easeInOutCubic,
    );
    _updateScrollState();
  }

  Widget _revealed(String id, Widget child) {
    final visible = _revealedSections.contains(id);
    return AnimatedSlide(
      duration: const Duration(milliseconds: 550),
      curve: Curves.easeOutCubic,
      offset: visible ? Offset.zero : const Offset(0, .045),
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 550),
        curve: Curves.easeOut,
        opacity: visible ? 1 : 0,
        child: child,
      ),
    );
  }

  Widget _section(String id, Widget child) => KeyedSubtree(
        key: _sectionKeys[id],
        child: _revealed(id, child),
      );

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final background = width < 600
        ? 'assets/gradient-bg-mobile.png'
        : 'assets/gradient-bg.png';

    return Scaffold(
      backgroundColor: const Color(0xFFF8F5FF),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(background, fit: BoxFit.cover, alignment: Alignment.topCenter),
          ),
          Positioned.fill(
            child: ColoredBox(color: Colors.white.withValues(alpha: .16)),
          ),
          Positioned.fill(
            child: NotificationListener<ScrollNotification>(
              onNotification: (notification) {
                if (notification is ScrollUpdateNotification) _updateScrollState();
                return false;
              },
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: const ClampingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 960),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: width < 600 ? 20 : 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _section('home', HeroSection(onExplore: () => _scrollTo('about'))),
                          const SoftDivider(),
                          _section('about', const AboutSection()),
                          const SoftDivider(),
                          _section('projects', const ProjectsSection()),
                          const SoftDivider(),
                          _section('currently', const CurrentlySection()),
                          const SoftDivider(),
                          _section('music', const MusicSection()),
                          const SoftDivider(),
                          _section('facts', const FactsSection()),
                          const SoftDivider(),
                          _section('diary', const ThoughtsSection()),
                          const SoftDivider(),
                          _section(
                            'terminal',
                            const SectionBlock(
                              icon: Icons.terminal_rounded,
                              title: 'Terminal',
                              child: TerminalSection(),
                            ),
                          ),
                          const SiteFooter(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 10,
            left: 12,
            right: 12,
            child: SafeArea(
              bottom: false,
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 700),
                  child: GlassNav(
                    activeSection: _activeSection,
                    onSelect: _scrollTo,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
