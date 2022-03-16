// @dart = 2.8
import 'package:flutter/widgets.dart';
import 'package:flutter_kick_starter/squad_board/model/dashboard_grid_display_model.dart';
import 'package:flutter_kick_starter/common/constants/ui_constant.dart';
import 'package:flutter/material.dart';

class DashboardGridWidget extends StatelessWidget {
  final DashboardGridDisplayModel _displayModel;

  const DashboardGridWidget({Key key, DashboardGridDisplayModel displayModel})
      : _displayModel = displayModel,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(Dimens.small),
        child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: DesignColor.background),
            child: new Center(
                child: new Text(_displayModel.title,
                    textAlign: TextAlign.center))));
  }
}
