import 'package:flutter/material.dart';
import 'package:whoami/services/github_stats.dart';
import 'package:whoami/util/profile-widgets.dart';
import 'package:whoami/util/function/open-webpage.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({required this.onExplore, super.key});
  final VoidCallback onExplore;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final small = constraints.maxWidth < 600;
        return Padding(
          padding: EdgeInsets.fromLTRB(0, small ? 145 : 138, 0, 52),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.local_florist_rounded,
                size: small ? 42 : 48,
                color: pink,
              ),
              const SizedBox(height: 10),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 16,
                children: [
                  Text(
                    "hiii, i'm",
                    style: TextStyle(
                      fontSize: small ? 43 : 72,
                      height: 1.08,
                      letterSpacing: small ? -1.3 : -2.4,
                      fontWeight: FontWeight.w700,
                      color: ink,
                    ),
                  ),
                  Text(
                    'Semire',
                    style: TextStyle(
                      fontSize: small ? 43 : 72,
                      height: 1.08,
                      letterSpacing: small ? -1.3 : -2.4,
                      fontWeight: FontWeight.w700,
                      color: pink,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 600),
                child: Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: small ? 16 : 19,
                      height: 1.65,
                      color: mutedInk,
                    ),
                    children: const [
                      TextSpan(text: 'aka '),
                      TextSpan(
                        text: 'Serenity',
                        style: TextStyle(
                          color: purple,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      TextSpan(
                        text:
                            ' · CS student · professional overthinker · chaos enjoyer',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 22),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: const [
                  AccentPill(label: 'he/him', color: purple),
                  AccentPill(label: 'Lagos, Nigeria', color: teal),
                  AccentPill(label: 'Pan-Atlantic University'),
                  AccentPill(label: '1st Year CS', color: orange),
                ],
              ),
              const SizedBox(height: 22),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  _SocialButton(
                    icon: Icons.code_rounded,
                    label: 'GitHub',
                    onTap: () => openWebsite('https://github.com/serenebliss0'),
                  ),
                  _SocialButton(
                    icon: Icons.mail_outline_rounded,
                    label: 'Email',
                    onTap: () => openWebsite('mailto:semajayi1234@gmail.com'),
                  ),
                  _SocialButton(
                    icon: Icons.work_outline_rounded,
                    label: 'LinkedIn',
                    onTap: () =>
                        openWebsite('https://www.linkedin.com/in/semire/'),
                  ),
                ],
              ),
              const SizedBox(height: 48),
              TextButton.icon(
                onPressed: onExplore,
                icon: const Icon(Icons.south_rounded, size: 16),
                label: const Text('scroll to explore'),
                style: TextButton.styleFrom(
                  foregroundColor: mutedInk,
                  padding: EdgeInsets.zero,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SocialButton extends StatelessWidget {
  const _SocialButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => OutlinedButton.icon(
    onPressed: onTap,
    icon: Icon(icon, size: 16),
    label: Text(label),
    style: OutlinedButton.styleFrom(
      foregroundColor: ink,
      backgroundColor: Colors.white.withValues(alpha: 0.30),
      side: BorderSide(color: Colors.white.withValues(alpha: 0.80)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    ),
  );
}

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  static final _githubStats = GitHubStats.fetch();

  static const _hobbies = <(IconData, String)>[
    (Icons.menu_book_rounded, 'reading'),
    (Icons.edit_note_rounded, 'writing poems'),
    (Icons.palette_outlined, '3D modeling'),
    (Icons.tune_rounded, 'electronics'),
    (Icons.music_note_rounded, 'music'),
    (Icons.bolt_rounded, 'illustrator'),
    (Icons.movie_creation_outlined, 'after effects'),
    (Icons.photo_camera_outlined, 'photoshop'),
  ];

  static const _tools = <(IconData, String, Color)>[
    (Icons.bolt_rounded, 'C++', pink),
    (Icons.code_rounded, 'Rust', orange),
    (Icons.terminal_rounded, 'Python', teal),
    (Icons.build_rounded, 'C', purple),
    (Icons.favorite_rounded, 'C#', pink),
    (Icons.track_changes_rounded, 'Dart', purple),
    (Icons.flutter_dash_rounded, 'Flutter', teal),
    (Icons.settings_rounded, 'Arduino', orange),
    (Icons.view_in_ar_rounded, 'Blender', orange),
    (Icons.design_services_rounded, 'Figma', pink),
    (Icons.storage_rounded, 'Postgres', purple),
    (Icons.public_rounded, 'Nginx', teal),
  ];

  @override
  Widget build(BuildContext context) => SectionBlock(
    icon: Icons.auto_awesome_rounded,
    title: 'About',
    child: LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth > 720;
        final intro = GlassPanel(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text.rich(
                TextSpan(
                  style: TextStyle(
                    color: Color(0xCC2D1B4E),
                    fontSize: 15,
                    height: 1.75,
                  ),
                  children: [
                    TextSpan(
                      text: 'i like solving problems, building things that ',
                    ),
                    TextSpan(
                      text: '(eventually)',
                      style: TextStyle(fontStyle: FontStyle.italic),
                    ),
                    TextSpan(text: ' work, and learning literally everything.'),
                  ],
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                '{change}',
                style: TextStyle(
                  color: Color(0xCC2D1B4E),
                  fontSize: 15,
                  height: 1.75,
                ),
              ),
              const SizedBox(height: 22),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: _hobbies
                    .map((item) => _IconPill(icon: item.$1, label: item.$2))
                    .toList(),
              ),
            ],
          ),
        );
        final stats = GlassPanel(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 24),
          child: FutureBuilder<GitHubStats>(
            future: _githubStats,
            builder: (context, snapshot) {
              final liveStats = snapshot.data;
              return Row(
                children: [
                  Expanded(
                    child: _Stat(
                      value: liveStats?.contributions,
                      label: 'contributions',
                    ),
                  ),
                  Expanded(
                    child: _Stat(
                      value: liveStats?.repositories,
                      label: 'repos',
                    ),
                  ),
                  Expanded(
                    child: _Stat(
                      value: liveStats?.followers,
                      label: 'followers',
                    ),
                  ),
                ],
              );
            },
          ),
        );
        return Column(
          children: [
            if (wide)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: intro),
                  const SizedBox(width: 18),
                  Expanded(child: stats),
                ],
              )
            else ...[
              intro,
              const SizedBox(height: 14),
              stats,
            ],
            const SizedBox(height: 14),
            GlassPanel(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'TOOLS I USE',
                    style: TextStyle(
                      color: mutedInk,
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 18),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _tools
                        .map(
                          (item) => _IconPill(
                            icon: item.$1,
                            label: item.$2,
                            color: item.$3,
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ),
  );
}

class _IconPill extends StatelessWidget {
  const _IconPill({required this.icon, required this.label, this.color = pink});
  final IconData icon;
  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
    decoration: BoxDecoration(
      color: color.withValues(alpha: 0.09),
      border: Border.all(color: color.withValues(alpha: 0.17)),
      borderRadius: BorderRadius.circular(24),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: color),
        const SizedBox(width: 7),
        Text(
          label,
          style: TextStyle(
            color: color,
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

class _Stat extends StatelessWidget {
  const _Stat({required this.value, required this.label});
  final int? value;
  final String label;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      if (value == null)
        const Text(
          '—',
          style: TextStyle(
            color: pink,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        )
      else
        TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: value!.toDouble()),
          duration: const Duration(milliseconds: 1100),
          curve: Curves.easeOutCubic,
          builder: (context, n, _) => Text(
            n.round().toString(),
            style: const TextStyle(
              color: pink,
              fontSize: 25,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      const SizedBox(height: 4),
      Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(color: mutedInk, fontSize: 10),
      ),
    ],
  );
}

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  static const _projects = <_Project>[
    _Project(
      Icons.speaker_rounded,
      'shipped',
      'ESP32 Smart Speaker',
      'A Bluetooth + WiFi enabled smart speaker built from scratch with an ESP32. Hardware chaos, beautifully assembled.',
      'C++',
      teal,
      'esp32-smart-speaker',
    ),
    _Project(
      Icons.edit_note_rounded,
      'wip',
      'SemireScript',
      'A lexer for my own programming language. Yes, I made up a language. Yes, it compiles. No, I will not explain further.',
      'C++',
      orange,
      'semirescript-lexer',
    ),
    _Project(
      Icons.waves_rounded,
      'classified',
      'Wavelet',
      'An audio signal processing experiment that may or may not evolve into something bigger. Vibes-driven development.',
      'C++',
      purple,
      null,
    ),
    _Project(
      Icons.checklist_rounded,
      'shipped',
      '{project}',
      'A todo list app that I made and actually use. Dart + Flutter. The irony that this site was made in Flutter is intentional.',
      'Dart',
      teal,
      null,
    ),
    _Project(
      Icons.electrical_services_rounded,
      'ongoing',
      'Arduino Practice',
      'A collection of electronics experiments, half-broken breadboard circuits and proud moments. Electronics chaos, organized.',
      'C',
      pink,
      'arduino-practice',
    ),
    _Project(
      Icons.science_rounded,
      'ongoing',
      'Testing Repo',
      'Where all my Rust experiments live. Fighting the borrow checker since 2024. Sometimes it fights back.',
      'Rust',
      teal,
      'testing-repo',
    ),
  ];

  @override
  Widget build(BuildContext context) => SectionBlock(
    icon: Icons.handyman_rounded,
    title: 'Projects',
    child: LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth >= 860
            ? 3
            : constraints.maxWidth >= 560
            ? 2
            : 1;
        final ratio = columns == 1 ? 2.0 : 1.25;
        return GridView.builder(
          itemCount: _projects.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: ratio,
          ),
          itemBuilder: (context, index) =>
              _ProjectCard(project: _projects[index]),
        );
      },
    ),
  );
}

class _Project {
  const _Project(
    this.icon,
    this.status,
    this.name,
    this.description,
    this.language,
    this.color,
    this.slug,
  );
  final IconData icon;
  final String status;
  final String name;
  final String description;
  final String language;
  final Color color;
  final String? slug;
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.project});
  final _Project project;

  @override
  Widget build(BuildContext context) {
    return GlassPanel(
      padding: const EdgeInsets.all(18),
      radius: 22,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(project.icon, color: ink, size: 28),
              const Spacer(),
              AccentPill(
                label: _statusLabel(project.status),
                color: project.color,
              ),
            ],
          ),
          const SizedBox(height: 13),
          Text(
            project.name,
            style: const TextStyle(
              color: ink,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Expanded(
            child: Text(
              project.description,
              maxLines: 4,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: mutedInk,
                fontSize: 11,
                height: 1.55,
              ),
            ),
          ),
          Row(
            children: [
              AccentPill(label: project.language),
              const Spacer(),
              if (project.slug != null)
                InkWell(
                  onTap: () => openWebsite(
                    'https://github.com/serenebliss0/${project.slug}',
                  ),
                  child: const Row(
                    children: [
                      Text(
                        'view',
                        style: TextStyle(color: mutedInk, fontSize: 11),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.open_in_new_rounded,
                        size: 13,
                        color: mutedInk,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  String _statusLabel(String status) => switch (status) {
    'shipped' => 'shipped',
    'wip' => 'wip',
    'classified' => 'classified',
    _ => 'ongoing',
  };
}

class CurrentlySection extends StatelessWidget {
  const CurrentlySection({super.key});

  static const _learning = <(String, String, double, Color)>[
    ('C++ deep dive', 'templates, memory management, the works', .72, pink),
    ('Electronics & APIs', 'LVGL, hardware interfaces, REST', .58, teal),
    (
      'Rust ownership model',
      'fighting the borrow checker. it is winning.',
      .38,
      orange,
    ),
    ('3D in Blender', 'modeling, shaders, making pretty things', .62, purple),
  ];
  static const _building = <(IconData, String, String, Color)>[
    (
      Icons.edit_note_rounded,
      'SemireScript lexer',
      'tokenizing my way to glory',
      pink,
    ),
    (
      Icons.speaker_rounded,
      'LVGL experiments',
      'fighting UI elements (and winning... slowly)',
      teal,
    ),
    (Icons.waves_rounded, 'Wavelet', 'classified. trust the process.', purple),
    (
      Icons.build_rounded,
      'creative coding projects',
      'chaos-driven development',
      orange,
    ),
  ];

  @override
  Widget build(BuildContext context) => SectionBlock(
    icon: Icons.psychology_rounded,
    title: 'Currently',
    child: LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth > 720;
        return Column(
          children: [
            if (wide)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _learningPanel()),
                  const SizedBox(width: 16),
                  Expanded(child: _buildingPanel()),
                ],
              )
            else ...[
              _learningPanel(),
              const SizedBox(height: 14),
              _buildingPanel(),
            ],
            const SizedBox(height: 14),
            GlassPanel(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
              child: const Row(
                children: [
                  Icon(
                    Icons.lightbulb_outline_rounded,
                    color: orange,
                    size: 18,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      'trying not to break my code (again) — a daily affirmation',
                      style: TextStyle(color: mutedInk, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    ),
  );

  Widget _learningPanel() => GlassPanel(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'LEARNING',
          style: TextStyle(
            color: mutedInk,
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 15),
        for (final item in _learning) ...[
          Text(
            item.$1,
            style: const TextStyle(
              color: ink,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 3),
          Text(item.$2, style: const TextStyle(color: mutedInk, fontSize: 10)),
          const SizedBox(height: 7),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LinearProgressIndicator(
              value: item.$3,
              minHeight: 4,
              color: item.$4,
              backgroundColor: item.$4.withValues(alpha: 0.13),
            ),
          ),
          const SizedBox(height: 13),
        ],
      ],
    ),
  );

  Widget _buildingPanel() => GlassPanel(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'BUILDING',
          style: TextStyle(
            color: mutedInk,
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 13),
        for (final item in _building) ...[
          Row(
            children: [
              Icon(item.$1, color: item.$4, size: 20),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.$2,
                      style: const TextStyle(
                        color: ink,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      item.$3,
                      style: const TextStyle(color: mutedInk, fontSize: 10),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
        ],
      ],
    ),
  );
}

class MusicSection extends StatelessWidget {
  const MusicSection({super.key});

  @override
  Widget build(BuildContext context) => SectionBlock(
    icon: Icons.music_note_rounded,
    title: 'Music',
    child: LayoutBuilder(
      builder: (context, constraints) {
        final narrow = constraints.maxWidth < 680;
        final nowPlaying = GlassPanel(
          tint: pink,
          tintOpacity: 0.12,
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [pink, purple]),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(
                  Icons.music_note_rounded,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 14),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CURRENTLY VIBING TO',
                      style: TextStyle(
                        color: mutedInk,
                        fontSize: 9,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'something ethereal',
                      style: TextStyle(
                        color: ink,
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'lo-fi × ambient × chaos',
                      style: TextStyle(color: mutedInk, fontSize: 11),
                    ),
                  ],
                ),
              ),
              const _Equalizer(),
            ],
          ),
        );
        final moods = GlassPanel(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'GENRE MOODS',
                style: TextStyle(
                  color: mutedInk,
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 13),
              const Wrap(
                spacing: 7,
                runSpacing: 7,
                children: [
                  AccentPill(label: 'lo-fi beats', color: purple),
                  AccentPill(label: 'ambient', color: teal),
                  AccentPill(label: 'hyperpop', color: pink),
                  AccentPill(label: 'indie', color: teal),
                  AccentPill(label: 'city pop', color: orange),
                  AccentPill(label: 'drum & bass', color: pink),
                ],
              ),
            ],
          ),
        );
        final quote = GlassPanel(
          padding: const EdgeInsets.all(16),
          child: const Text(
            '“music is the background process that keeps me running. if i\'m coding and there\'s no music, something has gone very wrong.”',
            style: TextStyle(
              color: mutedInk,
              fontSize: 12,
              height: 1.7,
              fontStyle: FontStyle.italic,
            ),
          ),
        );
        return Column(
          children: [
            if (narrow) ...[
              nowPlaying,
              const SizedBox(height: 14),
              moods,
              const SizedBox(height: 14),
              quote,
            ] else
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [nowPlaying, const SizedBox(height: 14), quote],
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(child: moods),
                ],
              ),
          ],
        );
      },
    ),
  );
}

class _Equalizer extends StatefulWidget {
  const _Equalizer();
  @override
  State<_Equalizer> createState() => _EqualizerState();
}

class _EqualizerState extends State<_Equalizer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 900),
  )..repeat(reverse: true);
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) => Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(5, (i) {
          final height = 5 + ((_controller.value + i * .17) % 1) * 20;
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            width: 3,
            height: height,
            decoration: BoxDecoration(
              color: i.isEven ? pink : purple,
              borderRadius: BorderRadius.circular(4),
            ),
          );
        }),
      ),
    );
  }
}

class FactsSection extends StatefulWidget {
  const FactsSection({super.key});
  @override
  State<FactsSection> createState() => _FactsSectionState();
}

class _FactsSectionState extends State<FactsSection> {
  int? _openFact;
  static const _facts = <(IconData, String, String, Color)>[
    (
      Icons.bug_report_rounded,
      'i once spent 3 hours debugging something caused by a vector being initialized with a size',
      'It needed capacity, not a pre-filled size. The compiler was right. I was simply committed to the wrong interpretation.',
      pink,
    ),
    (
      Icons.flutter_dash_rounded,
      'this website was made out of boredom in flutter',
      'A tiny boredom project that kept collecting features until it became a whole corner of the internet.',
      teal,
    ),
    (
      Icons.casino_rounded,
      'i merged a PR without reviewing it and got a github achievement for it',
      'The YOLO achievement is real. The confidence behind that merge was... aspirational.',
      purple,
    ),
    (
      Icons.electrical_services_rounded,
      'i built a bluetooth + wifi speaker from an ESP32 before learning proper networking',
      'A working speaker first, a long networking rabbit hole immediately after.',
      orange,
    ),
    (
      Icons.edit_note_rounded,
      'i made up a programming language just to write a lexer for it',
      'SemireScript began with a made-up syntax and the very reasonable next step: tokenizing it.',
      pink,
    ),
    (
      Icons.coffee_rounded,
      'my commit messages are directly correlated to my caffeine levels',
      'The more coffee in the system, the more likely a commit message contains unnecessary lore.',
      teal,
    ),
  ];

  @override
  Widget build(BuildContext context) => SectionBlock(
    icon: Icons.sentiment_very_dissatisfied_rounded,
    title: 'Fun facts (click to reveal)',
    child: LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth >= 850
            ? 3
            : constraints.maxWidth >= 560
            ? 2
            : 1;
        final ratio = columns == 1 ? 2.15 : 1.35;
        return GridView.builder(
          itemCount: _facts.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: ratio,
          ),
          itemBuilder: (context, index) {
            final fact = _facts[index];
            final expanded = _openFact == index;
            return Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(22),
                onTap: () =>
                    setState(() => _openFact = expanded ? null : index),
                child: GlassPanel(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(fact.$1, size: 21, color: fact.$4),
                      const SizedBox(height: 12),
                      Expanded(
                        child: AnimatedSwitcher(
                          duration: const Duration(milliseconds: 260),
                          child: Text(
                            expanded ? fact.$3 : fact.$2,
                            key: ValueKey(expanded),
                            maxLines: 5,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: mutedInk,
                              fontSize: 12,
                              height: 1.55,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        expanded
                            ? 'tap to close ↑'
                            : 'tap for the rest of the story →',
                        style: TextStyle(
                          color: fact.$4,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    ),
  );
}

class ThoughtsSection extends StatelessWidget {
  const ThoughtsSection({super.key});
  static const _thoughts = <(IconData, String, String, Color)>[
    (
      Icons.nightlight_round,
      'somewhere in 2025',
      '“there\'s something deeply humbling about writing code at 2am and realizing the bug was a missing semicolon. the compiler doesn\'t care about your feelings.”',
      purple,
    ),
    (
      Icons.coffee_rounded,
      'after a long session',
      '“learning is weird. one day you understand nothing, then suddenly you understand everything, and then you understand just enough to realize how much you still don\'t know.”',
      teal,
    ),
    (
      Icons.palette_outlined,
      'on making things',
      '“the gap between ‘i have an idea’ and ‘the thing exists’ is where most projects live forever. i\'ve decided my projects will not live there. (some of them still do.)”',
      orange,
    ),
    (
      Icons.school_rounded,
      'mid-semester thought',
      '“CS is equal parts beautiful, frustrating, magical, and humbling. some days i build something and feel like a wizard. other days the wizard is the bug in my own code.”',
      purple,
    ),
    (
      Icons.electrical_services_rounded,
      'electronics diary',
      '“there\'s a certain joy in soldering components together and watching a circuit come to life. hardware doesn\'t lie. it either works or it doesn\'t. no exceptions, no maybe.”',
      teal,
    ),
    (
      Icons.local_florist_rounded,
      'a quiet evening',
      '“i want to build things that matter. not necessarily world-changing things — just things that work well, feel good to use, and were made with care. that\'s enough.”',
      pink,
    ),
  ];

  @override
  Widget build(BuildContext context) => SectionBlock(
    icon: Icons.menu_book_rounded,
    title: 'Thoughts & fragments',
    subtitle: 'not a diary. just thoughts that needed somewhere to live.',
    child: LayoutBuilder(
      builder: (context, constraints) {
        final columns = constraints.maxWidth >= 850
            ? 3
            : constraints.maxWidth >= 560
            ? 2
            : 1;
        final ratio = columns == 1 ? 1.75 : 1.45;
        return GridView.builder(
          itemCount: _thoughts.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: ratio,
          ),
          itemBuilder: (context, index) {
            final thought = _thoughts[index];
            return GlassPanel(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(thought.$1, color: thought.$4, size: 19),
                      const SizedBox(width: 9),
                      Expanded(
                        child: Text(
                          thought.$2,
                          style: const TextStyle(
                            color: ink,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 13),
                  Expanded(
                    child: Text(
                      thought.$3,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                        color: mutedInk,
                        fontSize: 11,
                        height: 1.6,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Icon(
                      Icons.auto_awesome,
                      color: thought.$4.withValues(alpha: 0.65),
                      size: 14,
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    ),
  );
}

class SiteFooter extends StatelessWidget {
  const SiteFooter({super.key});
  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.fromLTRB(12, 42, 12, 34),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('made with ', style: TextStyle(color: mutedInk, fontSize: 11)),
            Icon(Icons.favorite_rounded, size: 12, color: pink),
            Text(
              ' and boredom · serenebliss0',
              style: TextStyle(color: mutedInk, fontSize: 11),
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'fun fact: this site was made out of boredom in flutter',
          textAlign: TextAlign.center,
          style: TextStyle(color: mutedInk, fontSize: 10),
        ),
      ],
    ),
  );
}
