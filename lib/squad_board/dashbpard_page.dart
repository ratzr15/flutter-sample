import 'package:flutter/material.dart';
import 'package:flutter_kick_starter/squad_board/model/dashboard_grid_display_model.dart';
import 'package:flutter_kick_starter/squad_board/presentation/widgets/dashboard_grid_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const themeColor = Colors.white;

    return Scaffold(
      appBar: AppBar(
        title: Text("Grocery Shopping Squad"),
        elevation: 2.0,
      ),
      backgroundColor: themeColor,
      body: _buildGrid(context),
    );
  }

  Widget _buildButton(VoidCallback onPressed, List<Text> textChildren) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        overlayColor: MaterialStateProperty.resolveWith<Color?>(
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

  Widget _buildGrid(BuildContext context) {
    const displayModel = DashboardGridDisplayModel(
        title: "Squad members",
        subTitle: "About our squad",
        iconImagePath: "/localpath");

    const gridView = DashboardGridWidget(displayModel: displayModel);

    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: List.generate(100, (index) {
        return gridView;
      }),
    );
  }
}
