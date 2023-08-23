// @dart = 2.8
import 'package:design_system/ds_foundations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kick_starter/squad_board/model/dashboard_grid_display_model.dart';
import 'package:flutter_kick_starter/squad_board/presentation/widgets/dashboard_grid_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const themeColor = Colors.white;

    return Scaffold(
      appBar: AppBar(
        title: _TitleBarWidget(),
        elevation: 2.0,
      ),
      backgroundColor: themeColor,
      body: _sliverGrid(context),
    );
  }

  Widget _sliverGrid(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
          ),
          itemCount: 300,
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/dashboard_details');
              },
              child: DashboardGridWidget(
                displayModel: DashboardGridDisplayModel(title: 'Vegetables'),
              ),
            );
          }),
    );
  }
}

class _TitleBarWidget extends StatelessWidget {
  const _TitleBarWidget();

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        child: Text(
          'Categories',
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        width: 20,
        height: 20,
        color: DesignColor.colorNeutralWhite,
      )
    ]);
  }
}
