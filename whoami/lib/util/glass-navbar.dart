import 'package:flutter/material.dart';
import 'package:whoami/util/profile-widgets.dart';

class GlassNav extends StatefulWidget {
  const GlassNav({
    required this.activeSection,
    required this.onSelect,
    super.key,
  });

  final String activeSection;
  final ValueChanged<String> onSelect;

  @override
  State<GlassNav> createState() => _GlassNavState();
}

class _GlassNavState extends State<GlassNav> {
  bool _menuOpen = false;

  static const _items = <(String, String)>[
    ('home', 'whoami'),
    ('about', 'about'),
    ('projects', 'projects'),
    ('currently', 'currently'),
    ('music', 'music'),
    ('diary', 'diary'),
    ('terminal', 'terminal'),
  ];

  void _select(String id) {
    setState(() => _menuOpen = false);
    widget.onSelect(id);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final compact = constraints.maxWidth < 620;
        return GlassPanel(
          padding: EdgeInsets.symmetric(
            horizontal: compact ? 12 : 16,
            vertical: compact ? 8 : 9,
          ),
          radius: 32,
          tintOpacity: .76,
          borderOpacity: .78,
          shadowOpacity: .08,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  _NavButton(
                    label: 'whoami',
                    active: widget.activeSection == 'home',
                    onTap: () => _select('home'),
                    compact: compact,
                    brand: true,
                  ),
                  if (!compact) ...[
                    const SizedBox(width: 10),
                    Container(
                      width: 1,
                      height: 20,
                      color: ink.withValues(alpha: .12),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: _items
                            .skip(1)
                            .map(
                              (item) => _NavButton(
                                label: item.$2,
                                active: _isActive(item.$1),
                                onTap: () => _select(item.$1),
                                compact: false,
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ] else ...[
                    const Spacer(),
                    IconButton(
                      onPressed: () => setState(() => _menuOpen = !_menuOpen),
                      tooltip: _menuOpen
                          ? 'Close navigation'
                          : 'Open navigation',
                      visualDensity: VisualDensity.compact,
                      icon: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 180),
                        child: Icon(
                          _menuOpen ? Icons.close_rounded : Icons.menu_rounded,
                          key: ValueKey(_menuOpen),
                          color: ink,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              if (compact)
                AnimatedSize(
                  duration: const Duration(milliseconds: 240),
                  curve: Curves.easeInOutCubic,
                  child: _menuOpen
                      ? Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 2),
                          child: Column(
                            children: _items
                                .skip(1)
                                .map(
                                  (item) => _NavButton(
                                    label: item.$2,
                                    active: _isActive(item.$1),
                                    onTap: () => _select(item.$1),
                                    compact: true,
                                    expanded: true,
                                  ),
                                )
                                .toList(),
                          ),
                        )
                      : const SizedBox(width: double.infinity),
                ),
            ],
          ),
        );
      },
    );
  }

  bool _isActive(String id) =>
      widget.activeSection == id ||
      (widget.activeSection == 'facts' && id == 'music');
}

class _NavButton extends StatelessWidget {
  const _NavButton({
    required this.label,
    required this.active,
    required this.onTap,
    required this.compact,
    this.brand = false,
    this.expanded = false,
  });

  final String label;
  final bool active;
  final VoidCallback onTap;
  final bool compact;
  final bool brand;
  final bool expanded;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: compact ? 4 : 2,
        vertical: compact ? 2 : 0,
      ),
      child: Material(
        color: active ? pink.withValues(alpha: .12) : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: SizedBox(
            width: expanded ? double.infinity : null,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: brand ? 13 : 10,
                vertical: compact ? 8 : 8,
              ),
              child: Text(
                label,
                textAlign: expanded ? TextAlign.center : TextAlign.start,
                style: TextStyle(
                  color: active ? pink : mutedInk,
                  fontSize: brand
                      ? 13
                      : compact
                      ? 13
                      : 11,
                  fontWeight: active || brand
                      ? FontWeight.w700
                      : FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
