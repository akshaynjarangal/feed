import 'package:dotted_border/dotted_border.dart';
import 'package:feed/core/constants/app_constants.dart';
import 'package:feed/core/utils/app_colors.dart';
import 'package:feed/presentation/widgets/app_space_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AddFeedScreen extends StatelessWidget {
  const AddFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //Header Section
          SliverAppBar(
            pinned: true,
            centerTitle: false,
            leading: IconButton(
              icon: const Icon(
                CupertinoIcons.chevron_left_circle,
                color: AppColors.foreground,
              ),
              onPressed: () {
                navkey.currentState?.pop();
              },
            ),
            title: const Text(
              'Add Feed',
            ),
            titleTextStyle: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            actions: [
              Container(
                margin: const EdgeInsets.only(right: 16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: const Text(
                  'Share Post',
                  style: TextStyle(
                    color: AppColors.foreground,
                  ),
                ),
              ),
            ],
          ),
          //Body Section
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  DottedBorder(
                    dashPattern: const [12],
                    color: AppColors.foreground.withOpacity(0.5),
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    padding: const EdgeInsets.all(6),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: AspectRatio(
                        aspectRatio: 4 / 3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/gallery_add.svg',
                              height: 48,
                              width: 48,
                              // ignore: deprecated_member_use
                              color: AppColors.foreground,
                            ),
                            setHeight(16),
                            const Text("Select a video from Gallery"),
                          ],
                        ),
                      ),
                    ),
                  ),
                  setHeight(32),
                  DottedBorder(
                    dashPattern: const [12],
                    color: AppColors.foreground.withOpacity(0.5),
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(12),
                    padding: const EdgeInsets.all(6),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      child: AspectRatio(
                        aspectRatio: 16 / 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/thumbnail.svg',
                              height: 24,
                              width: 24,
                              // ignore: deprecated_member_use
                              color: AppColors.foreground,
                            ),
                            setWidth(16),
                            Text(
                              "Add a thumbnail",
                              style: TextStyle(
                                color: AppColors.foreground.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  setHeight(32),
                  Text(
                    "Add Description",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  TextFormField(
                    maxLines: 4,
                    minLines: 1,
                    textInputAction: TextInputAction.newline,
                    decoration: InputDecoration(
                      hintText: 'Write something about your video',
                      hintStyle:
                          Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w100,
                                color: AppColors.foreground.withOpacity(0.5),
                              ),
                      contentPadding: EdgeInsets.zero,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      border: InputBorder.none,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "Catergories",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.foreground,
                        ),
                        onPressed: () {},
                        child: Row(
                          children: [
                            Text(
                              "View All",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            setWidth(8),
                            const Icon(
                              CupertinoIcons.chevron_right_circle,
                              color: AppColors.foreground,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Wrap(
                    runSpacing: 8,
                    spacing: 8,
                    children: List.generate(
                      7,
                      (index) {
                        return OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 0,
                            ),
                            foregroundColor: AppColors.foreground,
                            side: const BorderSide(
                              color: AppColors.primary,
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            "Category $index",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        );
                      },
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
