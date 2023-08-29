import 'package:equatable/equatable.dart';

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
