import 'package:flutter/material.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/home/models/news_article.dart';
import 'package:smartscape/src/utils/constants/colors.dart';
import 'package:smartscape/src/utils/constants/sizes.dart';
import 'package:smartscape/src/utils/helper/helper_funtion.dart';

class NewsCard extends StatelessWidget {
  final NewsArticle article;
  final VoidCallback onTap;

  const NewsCard({
    super.key,
    required this.article,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace,
          vertical: TSizes.spaceBtwItems / 2,
        ),
        decoration: BoxDecoration(
          color: dark ? Colors.grey[900] : Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section with Overlay
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  child: Image.network(
                    article.urlToImage,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        height: 180,
                        color: dark ? Colors.grey[800] : Colors.grey[200],
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          size: 40,
                          color: dark ? Colors.grey[700] : Colors.grey[400],
                        ),
                      );
                    },
                  ),
                ),
                // Category Tag
                Positioned(
                  top: 12,
                  left: 12,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: TColors.primary.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Local News',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ),
                ),
              ],
            ),

            // Content Section
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    article.title,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w600,
                          height: 1.4,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),

                  // Description
                  Text(
                    article.description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: dark ? Colors.grey[400] : Colors.grey[600],
                          height: 1.5,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 16),

                  // Footer
                  Row(
                    children: [
                      // Author
                      Expanded(
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 12,
                              backgroundColor: TColors.primary.withOpacity(0.1),
                              child: const Icon(
                                Icons.person_outline,
                                size: 14,
                                color: TColors.primary,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                article.author,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium
                                    ?.copyWith(
                                      color: dark
                                          ? Colors.grey[400]
                                          : Colors.grey[600],
                                    ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Date
                      Row(
                        children: [
                          Icon(
                            Icons.access_time,
                            size: 14,
                            color: dark ? Colors.grey[400] : Colors.grey[600],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            article.publishedAt.substring(0, 10),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(
                                  color: dark
                                      ? Colors.grey[400]
                                      : Colors.grey[600],
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
