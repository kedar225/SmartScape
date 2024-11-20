import 'package:flutter/material.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/home/models/news_article.dart';
import 'package:smartscape/src/utils/constants/colors.dart';
import 'package:smartscape/src/utils/helper/helper_funtion.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailScreen extends StatelessWidget {
  final NewsArticle article;

  const NewsDetailScreen({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    
    return Scaffold(
      backgroundColor: dark ? Colors.black : Colors.white,
      body: CustomScrollView(
        slivers: [
          // Custom App Bar with Image
          SliverAppBar(
            expandedHeight: 300,
            floating: false,
            pinned: true,
            backgroundColor: dark ? Colors.black : Colors.white,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    article.urlToImage,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: dark ? Colors.grey[800] : Colors.grey[200],
                        child: Icon(
                          Icons.image_not_supported_outlined,
                          size: 40,
                          color: dark ? Colors.grey[700] : Colors.grey[400],
                        ),
                      );
                    },
                  ),
                  // Gradient Overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          dark ? Colors.black.withOpacity(0.7) : Colors.white.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            leading: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: dark ? Colors.grey[900]?.withOpacity(0.5) : Colors.white.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 16,
                  color: dark ? Colors.white : Colors.black,
                ),
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          
          // Content
          SliverToBoxAdapter(
            child: Container(
              color: dark ? Colors.black : Colors.white,
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category Tag
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: TColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      'Local News',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: TColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Title
                  Text(
                    article.title,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      height: 1.4,
                    ),
                  ),
                  const SizedBox(height: 16),
                  
                  // Author and Date
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: TColors.primary.withOpacity(0.1),
                        child: const Icon(
                          Icons.person_outline,
                          color: TColors.primary,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              article.author,
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              article.publishedAt.substring(0, 10),
                              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                color: dark ? Colors.grey[400] : Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.share_outlined,
                          color: dark ? Colors.white : Colors.black,
                        ),
                        onPressed: () {
                          // Implement share functionality
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  
                  // Content
                  Text(
                    article.content,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      height: 1.8,
                      color: dark ? Colors.grey[300] : Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  // Read More Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        // ignore: deprecated_member_use
                        if (await canLaunch(article.url)) {
                          // ignore: deprecated_member_use
                          await launch(article.url);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: TColors.primary,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Read Full Article',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}