import 'package:design_system/ds_components.dart';
import 'package:design_system/ds_foundations.dart';
import 'package:flutter/material.dart';

import '../model/banner_display_model.dart';

class BannerWidget extends StatelessWidget {
  final BannerDisplayModel model;
  final Function(String) onTap;
  static const _cornerRadius = Dimens.sizeXxs;
  static const _margin = Dimens.sizeS;
  final Function(String url, StackTrace? stackTrace) onBannerImageLoadFailure;

  const BannerWidget({
    Key? key,
    required this.model,
    required this.onTap,
    required this.onBannerImageLoadFailure,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bannerImageUrl = model.bannerUrl;
    return GestureDetector(
      onTap: onTap(model.bannerId),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(_cornerRadius),
        child: DSImageBase(
          image: bannerImageUrl,
          key: BannerWidgetKeys.createBannerImgeKey(
            model.bannerUrl,
          ),
          fit: BoxFit.fill,
          width: _bannerWidth(context),
          height: _bannerHeight(context),
          loadingErrorListener: (context, error, stackTrace) {
            onBannerImageLoadFailure(bannerImageUrl, stackTrace);
          },
        ),
      ),
    );
  }

  double _bannerWidth(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const bannerMargin = _margin * 2;
    return screenWidth - bannerMargin;
  }

  double _bannerHeight(BuildContext context) {
    const bannerWidthToHeightRatio = 2.95;
    final screenWidth = _bannerWidth(context);
    return screenWidth / bannerWidthToHeightRatio;
  }
}

abstract class BannerWidgetKeys {
  static const bannerListKey = Key('banners.list');

  static Key createBannerImgeKey(String title) {
    return Key('banners.item.image.$title');
  }
}
