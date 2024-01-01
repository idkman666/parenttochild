import 'package:flutter/material.dart';
import 'package:flutter_demo/constants/demo_text_style.dart';

class ParentWidget extends StatefulWidget {
  const ParentWidget({super.key});

  @override
  State<ParentWidget> createState() => _ParentWidgetState();
}

class _ParentWidgetState extends State<ParentWidget> {
  final GlobalKey<ChildWidgetState> _childKey = GlobalKey<ChildWidgetState>();
  String parentText = "Parent Text";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Demo"),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Container(
              width: size.width,
              color: Colors.blue,
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Parent Widget",
                    style: DemoTextStyle.copyWith(
                        fontSize: 20, color: Colors.black),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        _childKey.currentState?.changeValue();
                      },
                      child: const Text("Call Child Function")),
                  Text(
                    'Parent data: $parentText',
                    style: DemoTextStyle.copyWith(
                        fontSize: 18, fontWeight: FontWeight.normal),
                  ),
                ],
              )),
            ),
            ChildWidget(
              key: _childKey,
            )
          ],
        ),
      ),
    );
  }

  void changeParentData(String text) {
    setState(() {
      parentText = text;
    });
  }

  void changeParentData2() {
    setState(() {
      parentText = "Void Callback";
    });
  }
}

class ChildWidget extends StatefulWidget {
  const ChildWidget({super.key});

  @override
  State<ChildWidget> createState() => ChildWidgetState();
}

class ChildWidgetState extends State<ChildWidget> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green,
        ),
        child: Column(
          children: [
            const Text(
              "Child Widget",
              style: DemoTextStyle.headline1,
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Call Parent")),
            Center(
              child: Text(
                'Child value:  $value',
                style: DemoTextStyle.copyWith(
                    fontSize: 18, fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changeValue() {
    setState(() {
      value++;
    });
  }

  void changeValueDynamic(int val) {
    setState(() {
      value = val;
    });
  }
}

class ChildWidgetTwo extends StatefulWidget {
  final Function(String) callBackFunction;
  final VoidCallback voidCallback;
  const ChildWidgetTwo(
      {super.key, required this.voidCallback, required this.callBackFunction});

  @override
  State<ChildWidgetTwo> createState() => _ChildWidgetTwoState();
}

class _ChildWidgetTwoState extends State<ChildWidgetTwo> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.green,
        ),
        child: Center(
            child: Column(
          children: [
            const Text(
              "Child Widget",
              style: DemoTextStyle.headline1,
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                widget.callBackFunction("Custom string value");
              },
              child: const Text("Callback function"),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                widget.voidCallback();
              },
              child: const Text("Void callback"),
            )
          ],
        )),
      ),
    );
  }
}
