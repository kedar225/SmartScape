import 'package:flutter/material.dart';
import 'package:smartscape/src/common/widgets/custom_shapes_container/iconshape_smartfuntion.dart';
import 'package:smartscape/src/common/widgets/custom_shapes_container/primary_header_container.dart';
import 'package:smartscape/src/common/widgets/text/section_heading.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/home/models/news_article.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/home/screens/bill_screen.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/home/screens/calender_screen.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/home/screens/contact)screen.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/home/screens/news_screen.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/home/services/news_services.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/home/util/infra.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/home/widget/adbanner_slider.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/home/widget/home_appbar.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/home/widget/location_error_widget.dart';
import 'package:smartscape/src/features/authentication/screens/socialpage/screens/home/widget/news_card.dart';
import 'package:smartscape/src/utils/constants/colors.dart';
import 'package:smartscape/src/utils/constants/image_string.dart';
import 'package:smartscape/src/utils/constants/sizes.dart';
import 'package:smartscape/src/utils/helper/helper_funtion.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Initialize variables, subscribe to streams, etc.
  }

  @override
  void dispose() {
    // Cleanup resources, cancel subscriptions, etc.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align items to the start
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // AppBar
                  const THomeScreenWidget(),
                  const SizedBox(height: 4),

                  // Title Section
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TSectionHeading(
                          title: 'Smart Utility:',
                          showaActionButton: false,
                          textColor: Colors.white70,
                        ),
                        // const SizedBox(height: TSizes.spaceBtwItems),

                        // Row of items
                        Wrap(
                          spacing: 8.0, // Horizontal space between items
                          runSpacing: 8.0, // Vertical space between rows
                          alignment: WrapAlignment
                              .spaceAround, // Center items in the space
                          children: [
                            IconTitleWidget(
                              imagePath: TImage.finance_image,
                              title: 'Finance',
                              onTap: () {},
                            ),
                            IconTitleWidget(
                              imagePath: TImage.calendar_image,
                              title: 'Calender',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const CalendarScreen(),
                                  ),
                                );
                              },
                            ),
                            IconTitleWidget(
                              imagePath: TImage.home_image,
                              title: 'Home',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const BillsScreen(),
                                  ),
                                );
                              },
                            ),
                            const IconTitleWidget(
                              imagePath: TImage.notes_image,
                              title: 'Notes',
                            ),
                            IconTitleWidget(
                              imagePath: TImage.downtown_image,
                              title: 'Infrastructure',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RentalSearchScreen(),
                                  ),
                                );
                              },
                            ),
                            IconTitleWidget(
                              imagePath: TImage.contact_image,
                              title: 'Contact',
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        EmergencyContactsScreen(),
                                  ),
                                );
                              },
                            ),
                            const IconTitleWidget(
                              imagePath: TImage.fandom_image,
                              title: 'Wiki',
                            ),
                            const IconTitleWidget(
                              imagePath: TImage.more_image,
                              title: 'More',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                ],
              ),
            ),
            const Padding(
                padding: EdgeInsets.all(
                    TSizes.defaultSpace), // Adjust padding using your TSizes
                child: TAdSlider()), // Padding
            // const SizedBox(height: TSizes.spaceBtwItems / 2),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'News',
                style: TextStyle(
                  fontSize: 24, // You can adjust the font size
                  fontWeight: FontWeight.bold, // You can adjust the font weight
                  color: dark
                      ? Colors.white
                      : Colors.black, // Change color based on the condition
                ),
              ),
            ),

            // const SizedBox(
            //   height: TSizes.spaceBtwItems,
            // ),

            //News
            FutureBuilder<Map<String, dynamic>>(
              future: NewsService().getLocalNews(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(TSizes.defaultSpace),
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return LocationErrorWidget(
                    error: snapshot.error.toString(),
                    onRetry: () {
                      setState(() {
                        // Trigger rebuild to retry
                      });
                    },
                  );
                } else if (!snapshot.hasData ||
                    (snapshot.data!['articles'] as List).isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(TSizes.defaultSpace),
                      child: Text(
                        'No news available for ${snapshot.data?['city'] ?? 'your location'}',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  );
                }

                final articles =
                    snapshot.data!['articles'] as List<NewsArticle>;
                final city = snapshot.data!['city'] as String;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.defaultSpace / 2),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 20,
                            color: TColors.primary,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'News from $city',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: TColors.primary,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 1),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        return NewsCard(
                          article: articles[index],
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsDetailScreen(
                                  article: articles[index],
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
