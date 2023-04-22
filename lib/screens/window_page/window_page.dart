import 'package:flutter/material.dart';
import 'package:flutter_rain/screens/window_page/local_utils/window_controller.dart';
import 'package:get/get.dart';

import 'local_widgets/rain/rain.dart';

class WindowPage extends StatelessWidget {
  const WindowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WindowController>(
      init: Get.find<WindowController>(),
      builder: (controller) {
        return window(controller);
      },
    );
  }

  Widget window(WindowController controller) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.01)
              ..rotateY(.08),
            alignment: Alignment.centerRight,
            child: AspectRatio(
              aspectRatio: 4 / 5,
              child: LayoutBuilder(
                builder: (context, constraint) {
                  var size = constraint.biggest;
                  return Container(
                    decoration: BoxDecoration(color: Colors.brown),
                    padding: EdgeInsets.all(size.width / 10),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                Colors.black,
                                Colors.blue.shade900
                              ])),
                        ),
                        Rain(screen: size),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            width: 20,
            color: Colors.brown.shade700,
          )
        ],
      ),
    );
  }
}
