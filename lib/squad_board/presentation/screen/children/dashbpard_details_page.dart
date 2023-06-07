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
            return Card(
              color: Colors.amber,
              child: Center(child: Text('$index')),
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
        color: Colors.amber,
      )
    ]);
  }
}
