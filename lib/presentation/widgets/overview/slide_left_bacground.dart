import 'package:flutter/material.dart';

class SlideLeftBackground extends StatelessWidget {
  const SlideLeftBackground({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(15),
                      border:
                          Border.all(color: Colors.grey.withAlpha(40), width: 2)),
                  padding: const EdgeInsets.only(top: 1, right: 3),
                  child: const Icon(
                    Icons.done_all_rounded,
                    color: Colors.white,
                    size: 23,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
