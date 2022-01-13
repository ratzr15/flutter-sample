// @dart = 2.8
import 'package:equatable/equatable.dart';

class DashboardGridDisplayModel extends Equatable {
  final String iconImagePath;
  final String title;
  final String subTitle;

  const DashboardGridDisplayModel({
    this.iconImagePath,
    this.title,
    this.subTitle,
  });

  @override
  List<Object> get props => [
        iconImagePath,
        title,
        subTitle,
      ];
}
