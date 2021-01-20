import 'package:flutter/material.dart';
import 'package:slide_to_confirm/slide_to_confirm.dart';

class CheckinView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void confirmed() {
      print('Slider confirmed!');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Check in page'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            ConfirmationSlider(
              onConfirmation: () => confirmed(),
            )
          ],
        ),
      ),
    );
  }
}
