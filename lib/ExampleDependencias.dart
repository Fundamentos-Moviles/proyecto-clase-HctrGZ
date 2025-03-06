import 'package:flutter/material.dart';
import 'package:radio_group_v2/radio_group_v2.dart';
import 'package:pushable_button/pushable_button.dart';

import 'package:flutter/cupertino.dart';
import 'package:slider_button/slider_button.dart';


class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}
class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: SingleChildScrollView(
        child: Column(
          children: const [
            MyHomePage(),
            RadioGroupPage(),
            SliderPage()
          ],
        ),
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  String _selection = 'none';

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.bold,
    );
    final shadow = BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: const Offset(0, 2),
    );

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          PushableButton(
            height: 60,
            elevation: 8,
            hslColor: const HSLColor.fromAHSL(1.0, 356, 1.0, 0.43),
            shadow: shadow,
            onPressed: () => setState(() => _selection = '1'),
            child: const Text('PUSH ME 😎', style: textStyle),
          ),
          const SizedBox(height: 16),
          PushableButton(
            height: 60,
            elevation: 8,
            hslColor: const HSLColor.fromAHSL(1.0, 120, 1.0, 0.37),
            shadow: shadow,
            onPressed: () => setState(() => _selection = '2'),
            child: const Text('ENROLL NOW', style: textStyle),
          ),
          const SizedBox(height: 16),
          PushableButton(
            height: 60,
            elevation: 8,
            hslColor: const HSLColor.fromAHSL(1.0, 195, 1.0, 0.43),
            shadow: shadow,
            onPressed: () => setState(() => _selection = '3'),
            child: const Text('ADD TO BASKET', style: textStyle),
          ),
          const SizedBox(height: 16),
          Text(
            'Pushed: $_selection',
            style: textStyle.copyWith(color: Colors.black),
          ),
        ],
      ),
    );
  }
}

class RadioGroupPage extends StatefulWidget {
  const RadioGroupPage({super.key});

  @override
  State<RadioGroupPage> createState() => _RadioGroupPageState();
}
class _RadioGroupPageState extends State<RadioGroupPage> {
  String verticalValAutomatic = '';
  String verticalValRequested = '';
  String horizontalValAutomatic = '';
  String horizontalValRequested = '';

  final RadioGroupController verticalGroupController = RadioGroupController();
  final RadioGroupController horizontalGroupController = RadioGroupController();

  final List<String> verticalValues = [
    'Option 1',
    'Option 2',
    'Option 3',
    'Option 4',
    'Option 5',
  ];

  final List<Text> horizontalValues = [
    const Text('Item 1'),
    const Text('Item 2'),
    const Text('Item 3'),
    const Text('Item 4'),
    const Text('Item 5'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [

          Text('Radio Group Selection',
              style: Theme.of(context).textTheme.titleLarge),
          RadioGroup(
            controller: verticalGroupController,
            values: verticalValues,
            onChanged: (newValue) => setState(() {
              verticalValAutomatic = newValue.toString();
            }),
            decoration: const RadioGroupDecoration(
              labelStyle: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
          const SizedBox(height: 20),
          RadioGroup(
            controller: horizontalGroupController,
            values: horizontalValues,
            orientation: RadioGroupOrientation.horizontal,
            indexOfDefault: 0,
            onChanged: (newValue) => setState(() {
              horizontalValAutomatic = newValue.toString();
            }),
          ),
        ],
      ),
    );
  }
}

class SliderPage extends StatefulWidget {
  const SliderPage({super.key});

  @override
  State<SliderPage> createState() => _SliderPageState();
}
class _SliderPageState extends State<SliderPage> {
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children:[
          Text('Slider Button', style: TextStyle(fontSize: 30)),
          Center(
              child: SliderButton(
                action: () async {
                  ///Do something here OnSlide
                  return true;
                },
                label: Text(
                  "Slide to cancel Event",
                  style: TextStyle(
                      color: Color(0xff4a4a4a),
                      fontWeight: FontWeight.w500,
                      fontSize: 17),
                ),
                icon: Text(
                  "x",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    fontSize: 44,
                  ),
                ),
              )
          ),

        ],
      ),
    );
  }
}