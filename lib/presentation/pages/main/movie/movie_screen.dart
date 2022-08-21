import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sample_flutter/config/enum.dart';
import 'package:sample_flutter/domain/entities/film.dart';
import 'package:sample_flutter/presentation/pages/detail/detail_page.dart';
import 'package:sample_flutter/presentation/pages/detail/detail_page_argument.dart';
import 'package:sample_flutter/presentation/pages/list/list_page.dart';
import 'package:sample_flutter/presentation/pages/list/list_page_argument.dart';
import 'package:sample_flutter/presentation/widgets/card_carousel.dart';
import 'package:sample_flutter/presentation/widgets/card_error.dart';
import 'package:sample_flutter/presentation/widgets/card_skeleton.dart';

import 'movie_controller.dart';

class MovieScreen extends GetView<MovieController> {
  MovieScreen({Key? key}) : super(key: key) {
    controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        controller.fetch();
      },
      child: GetBuilder<MovieController>(builder: (c) {
        return SingleChildScrollView(
          child: Stack(
            children: [
              ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, idx) {
                    return Column(
                      children: [
                        _buildLabel(
                          context,
                          c.lists[idx].type,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        c.lists[idx].data.maybeWhen(
                          orElse: () {
                            return const CardSkeleton();
                          },
                          loading: () {
                            return const CardSkeleton();
                          },
                          success: (data) {
                            return _buildSuccess(context, data);
                          },
                          error: (message) {
                            return CardError(message: message);
                          },
                        )
                      ],
                    );
                  },
                  separatorBuilder: (ctx, idx) {
                    return const SizedBox(
                      height: 32,
                    );
                  },
                  itemCount: c.lists.length,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildSuccess(BuildContext context, List<Film> films) {
    return CardCarousel(
      films: films,
      onTap: (id) {
        Get.toNamed(
          DetailPage.routeName,
          arguments: DetailPageArgument(id, FilmType.movie),
        );
      },
    );
  }

  Widget _buildLabel(BuildContext context, FilmListType type) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GestureDetector(
        onTap: () {
          Get.toNamed(
            ListPage.routeName,
            arguments: ListPageArgument(FilmType.movie, type),
          );
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('$type'),
            Row(
              children: [
                Text(
                  'View all',
                  style: Theme.of(context).textTheme.caption,
                ),
                const SizedBox(width: 4),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
