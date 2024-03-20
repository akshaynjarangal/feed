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
import 'package:get_time_ago/get_time_ago.dart';
import 'package:provider/provider.dart';

import 'flick_multi_manager/flick_multi_manager.dart';
import 'flick_multi_manager/flick_multi_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late FlickMultiManager flickMultiManager;

  @override
  void initState() {
    super.initState();
    flickMultiManager = FlickMultiManager();
  }

  @override
  dispose() {
    flickMultiManager.pause();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeProvider>(
        builder: (context, state, _) {
          log('Home Data: ${state.homeData}');
          log('Categories Data: ${state.categoriesData.length}');
          if (state.isLoading) {
            return const Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
                strokeWidth: 2,
              ),
            );
          }

          if (state.homeData != null && state.categoriesData.isNotEmpty) {
            return CustomScrollView(
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
                    //Category Section
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(70),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Row(
                            children: [
                              Row(
                                children: List.generate(
                                  context
                                          .watch<HomeProvider>()
                                          .homeData
                                          ?.categoryDict
                                          ?.length ??
                                      0,
                                  (index) {
                                    final snapshot =
                                        context.watch<HomeProvider>();
                                    final homeCategories = snapshot
                                        .homeData?.categoryDict?.reversed
                                        .toList();
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        right: index ==
                                                (snapshot.homeData!
                                                        .categoryDict!.length -
                                                    1)
                                            ? 0
                                            : 8.0,
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          OutlinedButton(
                                            style: OutlinedButton.styleFrom(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 16,
                                                vertical: 0,
                                              ),
                                              foregroundColor:
                                                  AppColors.foreground,
                                              backgroundColor: index == 0
                                                  ? AppColors.primary
                                                      .withOpacity(0.2)
                                                  : null,
                                              side: BorderSide(
                                                color: index == 0
                                                    ? AppColors.primary
                                                        .withOpacity(0.4)
                                                    : AppColors.foreground,
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: Row(
                                              children: [
                                                if (index == 0)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      right: 8.0,
                                                    ),
                                                    child: SvgPicture.asset(
                                                      'assets/icons/ankr.svg',
                                                      height: 16,
                                                    ),
                                                  ),
                                                Text(
                                                  homeCategories?[index]
                                                          .title ??
                                                      "",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall,
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (index == 0)
                                            Container(
                                              margin: const EdgeInsets.only(
                                                left: 8,
                                              ),
                                              width: 1,
                                              height: 32,
                                              color: AppColors.foreground
                                                  .withOpacity(0.5),
                                            ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                              setWidth(8),
                              Row(
                                children: List.generate(
                                  context
                                      .watch<HomeProvider>()
                                      .categoriesData
                                      .length,
                                  (index) {
                                    final mainCategories = context
                                        .watch<HomeProvider>()
                                        .categoriesData;
                                    return Padding(
                                      padding: EdgeInsets.only(
                                        right:
                                            index == (mainCategories.length - 1)
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
                                          side: const BorderSide(
                                            color: AppColors.foreground,
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          mainCategories[index].title ?? "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
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
                              CircleAvatar(
                                radius: 20,
                                backgroundImage: state.homeData?.results?[index]
                                            .user?.image ==
                                        null
                                    ? null
                                    : NetworkImage(
                                        Uri.https(
                                          AppUrls.domain,
                                          '${state.homeData?.results?[index].user?.image}',
                                        ).toString(),
                                      ),
                                child: state.homeData?.results?[index].user
                                            ?.image ==
                                        null
                                    ? const Icon(
                                        CupertinoIcons.person_fill,
                                        color: Colors.white,
                                      )
                                    : null,
                              ),
                              setWidth(8),
                              Expanded(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.homeData?.results?[index].user
                                              ?.name ??
                                          "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    setHeight(4),
                                    Text(
                                      GetTimeAgo.parse(
                                        state.homeData?.results?[index]
                                                .createdAt ??
                                            DateTime.now(),
                                      ),
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelSmall,
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
                            child: FlickMultiPlayer(
                              url: Uri.https(
                                AppUrls.domain,
                                "${state.homeData?.results?[index].video}",
                              ).toString(),
                              flickMultiManager: flickMultiManager,
                              image: Uri.https(
                                AppUrls.domain,
                                state.homeData?.results?[index].image ?? '',
                              ).toString(),
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
                              text: state.homeData?.results?[index]
                                          .description ==
                                      null
                                  ? ""
                                  : state.homeData?.results![index].description!
                                      .substring(
                                      0,
                                      (state.homeData!.results![index]
                                                  .description!.length <
                                              100)
                                          ? state.homeData!.results![index]
                                              .description!.length
                                          : 100,
                                    ),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w300),
                              children: [
                                if (state.homeData!.results![index].description!
                                        .length >
                                    100)
                                  TextSpan(
                                    text: "...See More",
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        log('Read more');
                                      },
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
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
                  itemCount: state.homeData?.results?.length ?? 0,
                ),
              ],
            );
          }
          return RefreshIndicator(
            onRefresh: () async {
              state.getCategories();
              state.getHomeData();
            },
            child: const Center(
              child: Text('No Data'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        foregroundColor: AppColors.foreground,
        onPressed: () async{
          await flickMultiManager.pause();
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
