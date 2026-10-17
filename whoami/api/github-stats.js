const username = 'serenebliss0';

export default async function handler(_request, response) {
  response.setHeader(
    'Cache-Control',
    'public, s-maxage=300, stale-while-revalidate=3600',
  );

  try {
    const headers = { 'User-Agent': 'whoami-personal-site' };
    const [profileResponse, contributionsResponse] = await Promise.all([
      fetch(`https://api.github.com/users/${username}`, { headers }),
      fetch(`https://github.com/users/${username}/contributions`, { headers }),
    ]);

    if (!profileResponse.ok || !contributionsResponse.ok) {
      throw new Error('GitHub returned an unsuccessful response.');
    }

    const profile = await profileResponse.json();
    const contributionPage = await contributionsResponse.text();
    const heading = contributionPage.match(
      /<h2[^>]*id="js-contribution-activity-description"[^>]*>([\s\S]*?)<\/h2>/i,
    );
    const contributionCount = heading?.[1]
      ?.replace(/<[^>]*>/g, ' ')
      .replace(/&nbsp;/g, ' ')
      .match(/[\d,]+/)?.[0];

    if (!contributionCount) {
      throw new Error('Could not read the contribution count from GitHub.');
    }

    response.status(200).json({
      username,
      contributions: Number(contributionCount.replace(/,/g, '')),
      repositories: profile.public_repos,
      followers: profile.followers,
      updatedAt: new Date().toISOString(),
    });
  } catch (error) {
    console.error('GitHub stats request failed:', error);
    response.status(502).json({ error: 'GitHub stats are temporarily unavailable.' });
  }
}
