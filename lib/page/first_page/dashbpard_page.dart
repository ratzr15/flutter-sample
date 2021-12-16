import 'package:flutter/material.dart';

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

  // A container for the body of the App
  Widget _buildContainer() {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          _buildButton(() {
            //Handle button click
          }, [Text('Engineers')]),
          SizedBox(height: 8),
          _buildButton(() {
            //Handle button click
          }, [Text('Managers')]),
          SizedBox(height: 8),
          Container(
            color: Colors.blueAccent,
            child: SizedBox(height: 100),
          )
        ],
      ),
    );
  }

  Widget _buildGrid(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      crossAxisSpacing: 8,
      mainAxisSpacing: 8,
      children: List.generate(100, (index) {
        return Center(
          child: Text(
            'Item $index',
            style: Theme.of(context).textTheme.headline5,
          ),
        );
      }),
    );
  }
}
