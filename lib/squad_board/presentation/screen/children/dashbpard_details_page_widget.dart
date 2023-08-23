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
        leading: BackButton(
          color: Colors.white,
          onPressed: () => {
            Navigator.of(context).pop(),
          },
        ),
        elevation: 2.0,
      ),
      backgroundColor: themeColor,
      body: _sliverGrid(context),
    );
  }

  Widget _sliverGrid(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: _Constants.bottomContainerHeight,
        color: Colors.orange,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _CampaignBarWidget(),
            SizedBox(
              height: _Constants.verticalPadding,
            ),
            SizedBox(
              height: _Constants.checkoutButtonHeight,
              width: MediaQuery.of(context).size.width -
                  _Constants.buttonWidthPadding,
              child: _buildButton(() {
                Navigator.pushNamed(context, '/dashboard_details');
              }, [
                Text('Checkout'),
              ]),
            ),
          ],
        ),
      ),
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

class _CampaignBarWidget extends StatelessWidget {
  const _CampaignBarWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: _Constants.horizontalPadding,
        right: _Constants.horizontalPadding,
        top: _Constants.horizontalPadding,
      ),
      child: Column(
        children: [
          _TextWidgetWithIconWidget(),
          _ProgressBarWidget(),
        ],
      ),
    );
  }
}

class _ProgressBarWidget extends StatelessWidget {
  const _ProgressBarWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: _Constants.progressBarHeight,
      width: MediaQuery.of(context).size.width - _Constants.buttonWidthPadding,
    );
  }
}

class _TextWidgetWithIconWidget extends StatelessWidget {
  const _TextWidgetWithIconWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _Constants.campaignProgressHeight,
      width: MediaQuery.of(context).size.width - _Constants.buttonWidthPadding,
      color: Colors.black26,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              color: Colors.amber,
            ),
            SizedBox(
              width: 16,
            ),
            Text(
              'Add around 20 AED',
              textAlign: TextAlign.left,
            ),
          ],
        ),
      ),
    );
  }
}

abstract class _Constants {
  static const double buttonWidthPadding = 36;
  static const double verticalPadding = 12;
  static const double horizontalPadding = 16;

  static const double checkoutButtonHeight = 54;
  static const double campaignProgressHeight = 48;
  static const double bottomContainerHeight = 150;
  static const double progressBarHeight = 4;
}
