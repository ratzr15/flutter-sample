import 'package:equatable/equatable.dart';

import 'banner_display_model.dart';

class BannerListDisplayModel extends Equatable {
  final List<BannerDisplayModel> banners;
  final int bannerPosition;

  const BannerListDisplayModel({
    required this.banners,
    required this.bannerPosition,
  });

  @override
  List<Object?> get props => [
        banners,
        bannerPosition,
      ];
}
