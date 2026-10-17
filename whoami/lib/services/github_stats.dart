import 'dart:convert';

import 'package:http/http.dart' as http;

/// Reads the public GitHub stats endpoint hosted alongside the Vercel site.
class GitHubStats {
  const GitHubStats({
    required this.contributions,
    required this.repositories,
    required this.followers,
  });

  final int contributions;
  final int repositories;
  final int followers;

  static Future<GitHubStats> fetch() async {
    final response = await http
        .get(Uri.base.resolve('/api/github-stats'))
        .timeout(const Duration(seconds: 12));

    if (response.statusCode != 200) {
      throw const FormatException('GitHub stats are unavailable.');
    }

    final json = jsonDecode(response.body) as Map<String, dynamic>;
    return GitHubStats(
      contributions: json['contributions'] as int,
      repositories: json['repositories'] as int,
      followers: json['followers'] as int,
    );
  }
}
