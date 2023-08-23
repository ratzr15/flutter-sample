import 'package:equatable/equatable.dart';

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

class BannerDisplayModel extends Equatable {
  final String bannerUrl;
  final String bannerId;

  const BannerDisplayModel({
    required this.bannerUrl,
    required this.bannerId,
  });

  @override
  List<Object?> get props => [
        bannerUrl,
        bannerId,
      ];
}
