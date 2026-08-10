import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ─────────────────────────────────────────────
// MODEL
// ─────────────────────────────────────────────

enum LineType { prompt, output, blank }

class TermLine {
  final LineType type;
  final String text;
  final Color? color;

  const TermLine.prompt(this.text)
      : type = LineType.prompt,
        color = null;
  const TermLine.output(this.text, {this.color}) : type = LineType.output;
  const TermLine.blank()
      : type = LineType.blank,
        text = '',
        color = null;
}

const String kPrompt = 'serenity@whoami:~\$';

// palette (matches the tsx hex values)
const Color pink = Color(0xFFFF6B9D);
const Color purple = Color(0xFF9B6FF5);
const Color teal = Color(0xFF4ECDC4);
const Color orange = Color(0xFFFFB347);
const Color blue = Color(0xFF54C5F8);
const Color red = Color(0xFFFF3366);
const Color dim = Color(0x802D1B4E); // rgba(45,27,78,0.5)-ish

// ─────────────────────────────────────────────
// COMMAND OUTPUT DATA
// (kept as functions so `date` etc. can be dynamic)
// ─────────────────────────────────────────────

final Map<String, List<TermLine> Function()> kCommands = {
  'help': () => const [
        TermLine.output('available commands:', color: purple),
        TermLine.blank(),
        TermLine.output('  whoami         — who am i?'),
        TermLine.output('  about           — my story'),
        TermLine.output('  ls              — list everything'),
        TermLine.output('  cat <file>      — read a file'),
        TermLine.output(
            '     about.txt · projects.txt · facts.txt · music.txt · stack.txt'),
        TermLine.output('  neofetch        — system info (the fun kind)'),
        TermLine.output('  achievements    — github trophies'),
        TermLine.output('  flutter         — a very important fact'),
        TermLine.output('  clear           — fresh start'),
        TermLine.blank(),
        TermLine.output(
            '  psst: try  git status  or  sudo make me a sandwich',
            color: Color(0x999B6FF5)),
      ],
  'whoami': () => const [
        TermLine.output('semire ajayi / serenity 🌸', color: pink),
        TermLine.output(
            '1st year cs major @ pan-atlantic university, lagos 🇳🇬'),
        TermLine.output('professional overthinker · chaos enjoyer · he/him'),
        TermLine.output(
            'powered by: curiosity, caffeine, and a little bit of chaos ☕'),
      ],
  'about': () => const [
        TermLine.output('hiii 🌸', color: pink),
        TermLine.blank(),
        TermLine.output("i'm Semire, a 1st year CS student at Pan-Atlantic University."),
        TermLine.output('i like solving problems, building things that (eventually) work,'),
        TermLine.output('and learning literally everything.'),
        TermLine.blank(),
        TermLine.output("when i'm not coding:"),
        TermLine.output('  → reading · writing poems · 3D modeling in blender'),
        TermLine.output('  → working with electronics · vibing with music'),
        TermLine.output('  → illustrator, after effects, photoshop, premiere pro'),
      ],
  'ls': () => const [
        TermLine.output('📄 about.txt', color: teal),
        TermLine.output('📄 projects.txt', color: teal),
        TermLine.output('📄 facts.txt', color: teal),
        TermLine.output('📄 music.txt', color: teal),
        TermLine.output('📄 stack.txt', color: teal),
        TermLine.output('🔒 diary/   (permission denied — try sudo?)',
            color: Color(0x99FF6B9D)),
      ],
  'neofetch': () => const [
        TermLine.output('     ✿ ✿ ✿ ✿           serenity@whoami', color: pink),
        TermLine.output('   ✿  🌸  ✿  🌸         ─────────────────────────',
            color: pink),
        TermLine.output('  ✿  ✿  ✿  ✿  ✿        OS: whoami/1.0 (React Edition™)'),
        TermLine.output('   ✿  🌸  ✿  🌸         Host: Pan-Atlantic University, Lagos 🇳🇬'),
        TermLine.output('     ✿ ✿ ✿ ✿           Shell: bash (and vibes)'),
        TermLine.output('                        Languages: C++, Rust, Python, Dart'),
        TermLine.output('                        Uptime: ~19 years'),
        TermLine.output('                        Status: perpetually caffeinated ☕'),
        TermLine.output('                        Mood: chaotic good ✨'),
        TermLine.output('                        Music: always on 🎵'),
        TermLine.output('                        GitHub: serenebliss0 (55 followers)'),
        TermLine.output('                        Contribs: 624 in the last year 📈'),
        TermLine.blank(),
        TermLine.output('  🟥🟧🟨🟩🟦🟪⬜   colors: pastel everything'),
      ],
  'achievements': () => const [
        TermLine.output('🏆 github achievements', color: orange),
        TermLine.blank(),
        TermLine.output('  ⚡ quickdraw     — closed issue in under 5 min'),
        TermLine.output('  🦈 pull shark ×2 — opened PRs that got merged (twice!)'),
        TermLine.output('  🎲 yolo          — merged a PR without review'),
        TermLine.output('                     "living dangerously since 2024"',
            color: Color(0xB29B6FF5)),
      ],
  'flutter': () => const [
        TermLine.output('Flutter 3.x.x (used to make this site... allegedly 🦋)',
            color: blue),
        TermLine.output('Dart SDK: 3.x.x'),
        TermLine.blank(),
        TermLine.output('  did you know this site was made in flutter?'),
        TermLine.output("  (okay fine, it's react + tailwind.)", color: dim),
        TermLine.output('  (but made out of boredom. that part is true. 💅)',
            color: pink),
      ],
  'git status': () => const [
        TermLine.output('On branch main', color: teal),
        TermLine.output('Your branch is ahead of origin/main by 1 commit.'),
        TermLine.blank(),
        TermLine.output('Changes staged for commit:'),
        TermLine.output('  modified:   me.tsx            (personality update 🌸)',
            color: teal),
        TermLine.output('  modified:   skills.tsx        (added new chaos features)',
            color: teal),
        TermLine.blank(),
        TermLine.output('Untracked files:'),
        TermLine.output('  ideas-that-probably-wont-work.txt', color: orange),
        TermLine.output('  debugging-session-3am.log', color: orange),
        TermLine.output('  this-compiles-somehow.cpp', color: orange),
      ],
  'sudo make me a sandwich': () => const [
        TermLine.output('sudo: nice try 😂', color: pink),
        TermLine.output('hint: coffee is more effective than sudo for motivation'),
      ],
  'rm -rf /': () => const [
        TermLine.output('nice try. my filesystem is vibes-protected. 🛡️',
            color: pink),
        TermLine.output("also that's not how this works. also don't."),
      ],
  'pwd': () => const [TermLine.output('/home/serenity/whoami')],
  'date': () => [TermLine.output('${DateTime.now().toString().split(".").first} (somewhere in Nigeria)')],
  'uname': () => const [
        TermLine.output('whoami 1.0.0 serenity-box Flutter+Dart'),
      ],
};

final Map<String, List<TermLine> Function()> kCatFiles = {
  'about.txt': () => const [
        TermLine.output('hiii 🌸', color: pink),
        TermLine.blank(),
        TermLine.output("i'm Semire, and i like solving problems,"),
        TermLine.output('building things that (eventually) work,'),
        TermLine.output('and learning literally everything.'),
        TermLine.blank(),
        TermLine.output('📍 Lagos, Nigeria · 🎓 Pan-Atlantic University'),
        TermLine.output('💻 1st Year CS · ☕ powered by caffeine + curiosity'),
      ],
  'projects.txt': () => const [
        TermLine.output('🔊 esp32-smart-speaker  — bluetooth + wifi speaker in C++',
            color: pink),
        TermLine.output("📝 semirescript-lexer   — a lexer for my own language (yes really)"),
        TermLine.output('📱 flutter-todo-list    — a todo app i actually use'),
        TermLine.output('⚡ arduino-practice    — electronics chaos, organized'),
        TermLine.output('🧪 testing-repo        — where rust experiments live'),
        TermLine.blank(),
        TermLine.output('🌊 wavelet             — [classified] coming soon™',
            color: purple),
      ],
  'facts.txt': () => const [
        TermLine.output('💀 fun facts:', color: pink),
        TermLine.blank(),
        TermLine.output('1. i once spent 3 hours debugging something caused by'),
        TermLine.output('   a vector being initialized with a size (not capacity)'),
        TermLine.blank(),
        TermLine.output('2. this website was made out of boredom in flutter~'),
        TermLine.output('   (you believe me right? right.)'),
        TermLine.blank(),
        TermLine.output('3. 624 contributions in the last year'),
        TermLine.blank(),
        TermLine.output('4. achieved the YOLO github achievement'),
        TermLine.output('   (merged a PR without review. no regrets.)'),
      ],
  'music.txt': () => const [
        TermLine.output('🎵 currently vibing to:', color: purple),
        TermLine.blank(),
        TermLine.output('  genres: lo-fi · ambient · hyperpop · indie · city pop'),
        TermLine.output('  status: music is always on while coding'),
        TermLine.output('  vibe: ✦ ✦ ✦ ✦ ✦'),
        TermLine.blank(),
        TermLine.output(
            '  "music is the background process that keeps me running"',
            color: dim),
      ],
  'stack.txt': () => const [
        TermLine.output('🛠️ tools i use:', color: teal),
        TermLine.blank(),
        TermLine.output('  languages:  C · C++ · C# · Python · Rust · Dart'),
        TermLine.output('  creative:   Blender · Figma · Illustrator · After Effects'),
        TermLine.output('               Photoshop · Premiere Pro · Canva'),
        TermLine.output('  hardware:   Arduino · ESP32 · PlatformIO'),
        TermLine.output('  tools:      Postgres · Nginx · Postman · Notion'),
        TermLine.output('               Jellyfin · Plex · Pi-Hole'),
      ],
};

List<TermLine> get kWelcome => const [
      TermLine.output(
          '┌─────────────────────────────────────────────┐',
          color: Color(0x669B6FF5)),
      TermLine.output(
          '│  welcome to whoami terminal  🌸              │',
          color: Color(0x669B6FF5)),
      TermLine.output(
          '│  type  help  to get started                 │',
          color: Color(0x669B6FF5)),
      TermLine.output(
          '└─────────────────────────────────────────────┘',
          color: Color(0x669B6FF5)),
      TermLine.blank(),
    ];

// ─────────────────────────────────────────────
// WIDGET
// ─────────────────────────────────────────────

class TerminalSection extends StatefulWidget {
  const TerminalSection({super.key});

  @override
  State<TerminalSection> createState() => _TerminalSectionState();
}

class _TerminalSectionState extends State<TerminalSection>
    with SingleTickerProviderStateMixin {
  List<TermLine> _lines = List.of(kWelcome);
  final List<String> _history = [];
  int _histIdx = -1;

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  final ScrollController _scrollController = ScrollController();

  bool _glitching = false;
  Timer? _glitchTimer;
  double _glitchOffset1 = 0, _glitchOffset2 = 0, _glitchOpacity = 1;
  final _rand = Random();

  static const List<String> _hintChips = [
    'help',
    'whoami',
    'neofetch',
    'cat facts.txt',
    'git status',
    'flutter',
  ];

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _scrollController.dispose();
    _glitchTimer?.cancel();
    super.dispose();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 250),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _run(String raw) {
    final cmd = raw.trim();
    if (cmd.isEmpty) return;

    _history.insert(0, cmd);
    if (_history.length > 50) _history.removeLast();
    _histIdx = -1;

    final promptLine = TermLine.prompt(cmd);

    if (cmd == 'clear') {
      setState(() => _lines = List.of(kWelcome));
      return;
    }

    if (cmd == 'sudo cd diary') {
      setState(() {
        _lines = [
          ..._lines,
          promptLine,
          const TermLine.output('sudo: escalating privileges...', color: orange),
          const TermLine.output(
              'accessing /diary... ██████████░░░░░░░░░░',
              color: pink),
          const TermLine.output(
              '[WARN] restricted zone. proceed at your own risk.',
              color: red),
          const TermLine.blank(),
        ];
      });
      _scrollToBottom();
      Future.delayed(const Duration(milliseconds: 700), _startGlitch);
      return;
    }

    List<TermLine> output;
    if (kCommands.containsKey(cmd)) {
      output = kCommands[cmd]!();
    } else if (cmd.startsWith('cat ')) {
      final file = cmd.substring(4).trim();
      if (kCatFiles.containsKey(file)) {
        output = kCatFiles[file]!();
      } else {
        output = [
          TermLine.output('cat: $file: No such file or directory', color: pink),
          const TermLine.output('try: ls  to see available files'),
        ];
      }
    } else if (cmd.startsWith('echo ')) {
      output = [TermLine.output(cmd.substring(5))];
    } else {
      output = [
        TermLine.output('command not found: $cmd', color: pink),
        const TermLine.output('type "help" for available commands'),
      ];
    }

    setState(() {
      _lines = [..._lines, promptLine, ...output, const TermLine.blank()];
    });
    _scrollToBottom();
  }

  // ── glitch easter egg: flickering red/blue channel jitter, then "reload" ──
  void _startGlitch() {
    setState(() => _glitching = true);
    _glitchTimer = Timer.periodic(const Duration(milliseconds: 80), (_) {
      setState(() {
        _glitchOffset1 = (_rand.nextDouble() - 0.5) * 14;
        _glitchOffset2 = (_rand.nextDouble() - 0.5) * 14;
        _glitchOpacity = 0.3 + _rand.nextDouble() * 0.7;
      });
    });
    Future.delayed(const Duration(milliseconds: 1900), () {
      _glitchTimer?.cancel();
      setState(() {
        _glitching = false;
        _lines = List.of(kWelcome); // stand-in for the tsx's window.location.reload()
      });
    });
  }

  void _handleKey(KeyEvent event) {
    if (event is! KeyDownEvent) return;
    if (event.logicalKey == LogicalKeyboardKey.arrowUp) {
      if (_histIdx + 1 < _history.length) {
        setState(() {
          _histIdx++;
          _controller.text = _history[_histIdx];
          _controller.selection =
              TextSelection.collapsed(offset: _controller.text.length);
        });
      }
    } else if (event.logicalKey == LogicalKeyboardKey.arrowDown) {
      setState(() {
        _histIdx = (_histIdx - 1).clamp(-1, _history.length - 1);
        _controller.text = _histIdx == -1 ? '' : _history[_histIdx];
        _controller.selection =
            TextSelection.collapsed(offset: _controller.text.length);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildTerminal(),
        if (_glitching) _buildGlitchOverlay(),
      ],
    );
  }

  Widget _buildTerminal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: const Color(0xE0120C26),
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: const Color(0x4D9B6FF5)),
            boxShadow: const [
              BoxShadow(
                color: Color(0x59120C26),
                blurRadius: 64,
                offset: Offset(0, 24),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // title bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0x12FFFFFF)),
                  ),
                ),
                child: Row(
                  children: [
                    Row(
                      children: const [
                        _Dot(color: Color(0xFFFF5F57)),
                        SizedBox(width: 6),
                        _Dot(color: Color(0xFFFFBD2E)),
                        SizedBox(width: 6),
                        _Dot(color: Color(0xFF28C840)),
                      ],
                    ),
                    const Expanded(
                      child: Text(
                        'whoami — bash',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 12,
                          color: Color(0x59FFFFFF),
                        ),
                      ),
                    ),
                    const SizedBox(width: 44), // balances the dots' width
                  ],
                ),
              ),
              // output + input
              SizedBox(
                height: 380,
                child: GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => _focusNode.requestFocus(),
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (final line in _lines) _buildLine(line),
                        _buildInputRow(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        _buildHintChips(),
      ],
    );
  }

  Widget _buildLine(TermLine line) {
    switch (line.type) {
      case LineType.blank:
        return const SizedBox(height: 8);
      case LineType.prompt:
        return Padding(
          padding: const EdgeInsets.only(bottom: 2),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                kPrompt,
                style: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  color: pink,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  line.text,
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 13,
                    color: Color(0xD9FFFFFF),
                  ),
                ),
              ),
            ],
          ),
        );
      case LineType.output:
        return Padding(
          padding: const EdgeInsets.only(bottom: 1),
          child: Text(
            line.text,
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 13,
              height: 1.65,
              color: line.color ?? const Color(0xB8FFFFFF),
            ),
          ),
        );
    }
  }

  Widget _buildInputRow() {
    return KeyboardListener(
      focusNode: FocusNode(), // separate node just to intercept raw keys
      onKeyEvent: _handleKey,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            kPrompt,
            style: TextStyle(
              fontFamily: 'monospace',
              fontSize: 13,
              fontWeight: FontWeight.bold,
              color: pink,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              autofocus: false,
              autocorrect: false,
              enableSuggestions: false,
              cursorColor: pink,
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 13,
                color: Color(0xD9FFFFFF),
              ),
              decoration: const InputDecoration(
                isDense: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
              ),
              onSubmitted: (val) {
                _run(val);
                _controller.clear();
                _focusNode.requestFocus();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHintChips() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: _hintChips.map((cmd) {
        return InkWell(
          borderRadius: BorderRadius.circular(10),
          onTap: () {
            _run(cmd);
            _focusNode.requestFocus();
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0x1A9B6FF5),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0x389B6FF5)),
            ),
            child: Text(
              cmd,
              style: const TextStyle(
                fontFamily: 'monospace',
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: purple,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildGlitchOverlay() {
    return Positioned.fill(
      child: IgnorePointer(
        child: Container(
          color: const Color(0xFF080010),
          child: Stack(
            children: [
              Transform.translate(
                offset: Offset(_glitchOffset1, 0),
                child: Opacity(
                  opacity: (_glitchOpacity * 0.6).clamp(0.0, 1.0),
                  child: Container(color: const Color(0x2EFF0033)),
                ),
              ),
              Transform.translate(
                offset: Offset(_glitchOffset2, 0),
                child: Opacity(
                  opacity: (_glitchOpacity * 0.6).clamp(0.0, 1.0),
                  child: Container(color: const Color(0x2E6400FF)),
                ),
              ),
              Align(
                alignment: Alignment(0, 0.7),
                child: Text(
                  '// d̴i̸a̷r̷y̶.̸e̴x̷e̵ ̸c̶o̴r̶r̵u̴p̵t̶e̷d̵',
                  style: TextStyle(
                    fontFamily: 'monospace',
                    fontSize: 13,
                    letterSpacing: 2,
                    color: Color((0xB3FF6B9D) & (_glitchOpacity > 0.5 ? 0xFFFFFFFF : 0x88FFFFFF)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final Color color;
  const _Dot({required this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}