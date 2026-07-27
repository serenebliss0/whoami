import 'package:flutter/material.dart';
import 'package:liquid_glass_widgets/liquid_glass_widgets.dart';

class GlassNav extends StatelessWidget {
  const GlassNav({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GlassContainer(
        padding: const EdgeInsets.symmetric(
          horizontal: 28,
          vertical: 12,
        ),
        shape: const LiquidRoundedSuperellipse(
          borderRadius: 32,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _NavItem(
              label: 'whoami',
              active: true,
            ),

            const SizedBox(width: 18),

            Container(
              width: 1,
              height: 18,
              color: Colors.black12,
            ),

            const SizedBox(width: 6),

            _NavItem(label: 'about'),
            _NavItem(label: 'projects'),
            _NavItem(label: 'currently'),
            _NavItem(label: 'music'),
            _NavItem(label: 'diary'),
            _NavItem(label: 'terminal'),
          ],
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({
    required this.label,
    this.active = false,
  });

  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          fontWeight: active
              ? FontWeight.w600
              : FontWeight.w400,
          color: active
              ? const Color(0xFFE86BA5)
              : const Color(0xFF6F6680),
        ),
      ),
    );
  }
}