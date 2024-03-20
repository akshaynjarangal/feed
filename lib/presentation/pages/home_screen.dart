import 'package:feed/core/utils/app_colors.dart';
import 'package:feed/presentation/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            sliver: SliverAppBar(
              centerTitle: false,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello Maria',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "Welcome back to section",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Image.asset('assets/images/avatar.png'),
                ),
              ],
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(80),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        context.watch<HomeProvider>().categories.length,
                        (index) {
                          final snapshot = context.watch<HomeProvider>();
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                foregroundColor: AppColors.foreground,
                                backgroundColor: snapshot.selectedCategory ==
                                        snapshot.categories[index]
                                    ? AppColors.primary.withOpacity(0.2)
                                    : null,
                                side: BorderSide(
                                  color: snapshot.selectedCategory ==
                                          snapshot.categories[index]
                                      ? AppColors.primary.withOpacity(0.4)
                                      : AppColors.foreground,
                                ),
                              ),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  if(index==0)SvgPicture.asset('assets/icons/ankr.svg'),
                                  Text(
                                    snapshot.categories[index],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
