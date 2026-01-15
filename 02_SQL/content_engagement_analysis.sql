Q1: Total engagement by platform

Purpose: Identify which platform drives the most engagement

SELECT
    platform,
    SUM(likes + comments + shares) AS total_engagement
FROM content_engagement
GROUP BY platform
ORDER BY total_engagement DESC;

Insight:
Instagram drives the highest total engagement.


Q2: Average engagement by content type

Purpose: Understand which content type performs best on average

SELECT
    content_type,
    AVG(likes + comments + shares) AS avg_engagement
FROM content_engagement
GROUP BY content_type
ORDER BY avg_engagement DESC;

Insight:
Reels outperform static content on average engagement.

Q3: Calculate engagement rate by platform

Purpose: Measure engagement efficiency, not just volume
Formula: (likes + comments + shares) / views

SELECT
    platform,
    ROUND(
        SUM(likes + comments + shares) * 1.0 / SUM(views),
        3
    ) AS engagement_rate
FROM content_engagement
GROUP BY platform
ORDER BY engagement_rate DESC;

Insight:
Engagement rate reveals efficiency, not just volume.

Q4: Calculate average engagement rate by content type

Purpose: Identify the most efficient content formats

SELECT
    content_type,
    ROUND(
        AVG((likes + comments + shares) * 1.0 / views),
        3
    ) AS avg_engagement_rate
FROM content_engagement
GROUP BY content_type
ORDER BY avg_engagement_rate DESC;

Insight:
Video-first formats generate higher engagement efficiency.

Q5: Engagement rate by platform and content type

Purpose: Decide what content to post on which platform

SELECT
    platform,
    content_type,
    ROUND(
        AVG((likes + comments + shares) * 1.0 / views),
        3
    ) AS engagement_rate
FROM content_engagement
GROUP BY platform, content_type
ORDER BY engagement_rate DESC;

Insight:
Content performance is platform-specific; one strategy does not fit all

Q6: Underperforming posts

Purpose: Identify posts performing below average engagement

SELECT
    post_id,
    platform,
    content_type,
    (likes + comments + shares) AS engagement
FROM content_engagement
WHERE (likes + comments + shares) <
      (SELECT AVG(likes + comments + shares)
       FROM content_engagement);

Insight:
Several posts perform below the dataset average engagement and should be reviewed for content quality or posting strategy.
