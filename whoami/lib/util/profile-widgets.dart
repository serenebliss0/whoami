import 'package:flutter/material.dart';

const ink = Color(0xFF2D1B4E);
const mutedInk = Color(0x9E2D1B4E);
const pink = Color(0xFFFF6B9D);
const purple = Color(0xFF9B6FF5);
const teal = Color(0xFF4ECDC4);
const orange = Color(0xFFFFB347);

/// A shared translucent surface for cards, chips, and other glassy controls.
class GlassPanel extends StatelessWidget {
  const GlassPanel({
    required this.child,
    this.padding = const EdgeInsets.all(22),
    this.radius = 24,
    this.tint = Colors.white,
    this.tintOpacity = 0.30,
    this.borderOpacity = 0.58,
    this.shadowOpacity = 0.10,
    super.key,
  });

  final Widget child;
  final EdgeInsetsGeometry padding;
  final double radius;
  final Color tint;
  final double tintOpacity;
  final double borderOpacity;
  final double shadowOpacity;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: tint.withValues(alpha: tintOpacity),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withValues(alpha: borderOpacity * .42),
              tint.withValues(alpha: tintOpacity),
            ],
          ),
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            color: Colors.white.withValues(alpha: borderOpacity),
            width: 0.9,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFFFB6C1).withValues(alpha: shadowOpacity),
              blurRadius: 32,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: child,
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle({required this.icon, required this.label, super.key});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 21, color: pink),
        const SizedBox(width: 12),
        Text(
          label.toUpperCase(),
          style: const TextStyle(
            color: mutedInk,
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}

class SectionBlock extends StatelessWidget {
  const SectionBlock({
    required this.icon,
    required this.title,
    required this.child,
    this.subtitle,
    super.key,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 54),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle(icon: icon, label: title),
          if (subtitle != null) ...[
            const SizedBox(height: 16),
            Text(
              subtitle!,
              style: const TextStyle(color: mutedInk, height: 1.6),
            ),
          ],
          const SizedBox(height: 28),
          child,
        ],
      ),
    );
  }
}

class AccentPill extends StatelessWidget {
  const AccentPill({required this.label, this.color = pink, super.key});

  final String label;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.10),
        border: Border.all(color: color.withValues(alpha: 0.24)),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class SoftDivider extends StatelessWidget {
  const SoftDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 120,
        height: 1,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [pink, purple]),
        ),
      ),
    );
  }
}
