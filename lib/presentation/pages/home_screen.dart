import 'dart:developer';
import 'package:feed/core/constants/app_constants.dart';
import 'package:feed/core/utils/app_colors.dart';
import 'package:feed/core/utils/app_routes.dart';
import 'package:feed/presentation/provider/home_provider.dart';
import 'package:feed/presentation/widgets/app_space_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
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
          //Header Section
          SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            sliver: SliverAppBar(
              floating: true,
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
                preferredSize: const Size.fromHeight(70),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: List.generate(
                        context.watch<HomeProvider>().categories.length,
                        (index) {
                          final snapshot = context.watch<HomeProvider>();
                          return Padding(
                            padding: EdgeInsets.only(
                              right: index == (snapshot.categories.length - 1)
                                  ? 0
                                  : 8.0,
                            ),
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 0,
                                ),
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
                                  if (index == 0)
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 8.0),
                                      child: SvgPicture.asset(
                                        'assets/icons/ankr.svg',
                                        height: 16,
                                      ),
                                    ),
                                  Text(
                                    snapshot.categories[index],
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
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
          //Body Section
          CupertinoSliverRefreshControl(
            builder: (
              context,
              mode,
              pullExtent,
              refreshTriggerPullDistance,
              refreshIndicatorExtent,
            ) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: pullExtent > refreshTriggerPullDistance ? 50 : 0,
                child: const Center(
                  child: CupertinoActivityIndicator(
                    color: AppColors.primary,
                  ),
                ),
              );
            },
          ),
          SliverList.separated(
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              AssetImage('assets/images/avatar.png'),
                        ),
                        setWidth(8),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Anagha Krishna",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              setHeight(4),
                              Text(
                                "2h ago",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: AspectRatio(
                      aspectRatio: 3 / 4,
                      child: Image.asset(
                        'assets/images/sample.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    child: RichText(
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        text:
                            "AnkR is a decentralized finance platform that aims to provide a decentralized infrastructure for Web3.0. It is a cross-chain platform that provides a decentralized infrastructure for Web3.0."
                                .substring(0, 100),
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.w300),
                        children: [
                          TextSpan(
                            text: "...Read more",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                log('Read more');
                              },
                            style:
                                Theme.of(context).textTheme.bodySmall?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) {
              return const Divider(
                color: Colors.transparent,
              );
            },
            itemCount: 10,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        foregroundColor: AppColors.foreground,
        onPressed: () {
          navkey.currentState?.pushNamed(AppRoutes.addFeed);
        },
        backgroundColor: AppColors.primary,
        child: const Icon(
          Icons.add,
          size: 48,
        ),
      ),
    );
  }
}
