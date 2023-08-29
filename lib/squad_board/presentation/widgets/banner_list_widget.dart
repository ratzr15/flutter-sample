import 'package:design_system/ds_foundations.dart';
import 'package:flutter/material.dart';
import 'package:sliver_tools/sliver_tools.dart';

import '../model/banner_display_model.dart';
import 'banner_widget.dart';

class BannerListWidget extends StatelessWidget {
  static const _topPadding = Dimens.sizeXs;
  static const _bottomPadding = Dimens.sizeXs;
  static const _horizontalPadding = Dimens.sizeS;

  final List<BannerDisplayModel> banners;
  final Function(String) onTap;
  final void Function(String url, StackTrace? stackTrace)
      onBannerImageLoadFailure;

  const BannerListWidget({
    Key? key,
    required this.banners,
    required this.onTap,
    required this.onBannerImageLoadFailure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiSliver(
      children: [
        SliverStack(
          children: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.only(
                top: _topPadding,
                bottom: _bottomPadding,
              ),
              sliver: SliverToBoxAdapter(
                child: SizedBox(
                  height: _listHeight(context),
                  child: ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        horizontal: _horizontalPadding),
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (_, __) =>
                        const SizedBox(width: Dimens.sizeXxs),
                    itemCount: banners.length,
                    itemBuilder: (context, index) {
                      final model = banners[index];
                      return _buildBannerWidget(
                        context,
                        model,
                        index,
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBannerWidget(
    BuildContext context,
    BannerDisplayModel model,
    int index,
  ) {
    return BannerWidget(
      key: BannersWidgetKeys.createBannersKey(model.bannerId),
      model: model,
      onTap: (bannerId) => onTap(bannerId),
      onBannerImageLoadFailure: (url, stackTrace) =>
          onBannerImageLoadFailure(url, stackTrace),
    );
  }

  double _bannerWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const bannerMargin = _horizontalPadding * 2;
    return screenWidth - bannerMargin;
  }

  double _listHeight(BuildContext context) {
    const bannerWidthToHeightRatio = 2.95;
    final screenWidth = _bannerWidth(context);
    return screenWidth / bannerWidthToHeightRatio;
  }
}

abstract class BannersWidgetKeys {
  static const bannerListKey = Key('banners.list');

  static Key createBannersKey(String title) {
    return Key('banners.item.$title');
  }

  BannersWidgetKeys._();
}
