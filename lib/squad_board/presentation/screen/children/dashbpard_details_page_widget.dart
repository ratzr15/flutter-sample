// @dart = 2.8
import 'package:flutter/material.dart';

class DashboardDetailsScreen extends StatelessWidget {
  const DashboardDetailsScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const themeColor = Colors.white;

    return Scaffold(
      appBar: AppBar(
        title: _TitleBarWidget(),
        leading: const BackButton(
          color: Colors.white,
        ),
        elevation: 2.0,
      ),
      backgroundColor: themeColor,
      body: _sliverGrid(context),
    );
  }

  Widget _sliverGrid(BuildContext context) {
    return Container(
      color: Colors.orangeAccent,
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
          'Details',
          overflow: TextOverflow.ellipsis,
        ),
      ),
      Container(
        width: 20,
        height: 20,
        color: Colors.amber,
      )
    ]);
  }
}
