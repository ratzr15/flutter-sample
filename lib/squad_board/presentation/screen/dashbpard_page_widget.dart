// @dart = 2.8
import 'package:flutter/material.dart';
import 'package:flutter_kick_starter/squad_board/model/dashboard_grid_display_model.dart';
import 'package:flutter_kick_starter/squad_board/presentation/widgets/dashboard_grid_widget.dart';

import 'children/dashbpard_details_page_widget.dart';

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

  Widget _buildButton(VoidCallback onPressed, List<Text> textChildren) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        overlayColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.focused)) return Colors.red;
          return null;
        }),
      ),
      onPressed: () {
        onPressed();
      },
      child: textChildren[0],
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
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DashboardDetailsScreen(),
                  ),
                  (Route<dynamic> route) => false,
                );
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
        color: Colors.amber,
      )
    ]);
  }
}
