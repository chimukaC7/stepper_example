import 'package:flutter/material.dart';

class StepperPage extends StatefulWidget {

  const StepperPage({super.key,}) ;

  @override
  State<StepperPage> createState() => _StepperPageState();
}

class _StepperPageState extends State<StepperPage> {

  int _currentstep = 0;

  void _movetonext() {
    setState(() {
      if (_currentstep < spr.length - 1) {
        _currentstep++;
      }
    });
  }

  void _movetostart() {
    setState(() {
      _currentstep = 0;
    });
  }

  void _showcontent(int s) {
    showDialog<Null>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('You clicked on'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                spr[s].title,
                // spr[s].subtitle,
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 2,
        title: const Text("Stepper View Page"),
        backgroundColor: Colors.blue[200],
      ),
      body: Stepper(
        steps: _getSteps(context),
        type: StepperType.vertical,
        currentStep: _currentstep,
        onStepContinue: _movetonext,
        onStepCancel: _movetostart,
        onStepTapped: _showcontent,
      ),
    );
  }

  List<Step> spr = <Step>[];

  List<Step> _getSteps(BuildContext context) {
    spr = <Step>[
      Step(
        title: const Text('Hello1'),
        subtitle: const Text('SubTitle1'),
        content: const Text('This is Content1'),
        state: _getState(1),
        isActive: true,
      ),
      Step(
        title: const Text('Hello2'),
        subtitle: const Text('SubTitle2'),
        content: const Text('This is Content2'),
        state: _getState(2),
        isActive: true,
      ),
      Step(
        title: const Text('Hello3'),
        subtitle: const Text('SubTitle3'),
        content: const Text('This is Content3'),
        state: _getState(3),
        isActive: true,
      ),
      Step(
        title: const Text('Hello4'),
        subtitle: const Text('SubTitle4'),
        content: const Text('This is Content4'),
        state: _getState(4),
        isActive: true,
      ),
      Step(
        title: const Text('Hello5'),
        subtitle: const Text('SubTitle5'),
        content: const Text('This is Content5'),
        state: _getState(5),
        isActive: true,
      ),
      Step(
        title: const Text('Hello6'),
        subtitle: const Text('SubTitle6'),
        content: const Text('This is Content6'),
        state: _getState(6),
        isActive: true,
      ),
      Step(
        title: const Text('Hello7'),
        subtitle: const Text('SubTitle7'),
        content: const Text('This is Content7'),
        state: _getState(7),
        isActive: true,
      ),
      Step(
        title: const Text('Hello8'),
        subtitle: const Text('SubTitle8'),
        content: const Text('This is Content8'),
        state: _getState(8),
        isActive: true,
      ),
      Step(
        title: const Text('Hello9'),
        subtitle: const Text('SubTitle9'),
        content: const Text('This is Content9'),
        state: _getState(9),
        isActive: true,
      ),
      Step(
        title: const Text('Hello10'),
        subtitle: const Text('SubTitle10'),
        content: const Text('This is Content10'),
        state: _getState(10),
        isActive: _currentstep < 9, // Disable if current step is 9 (index 10)
      ),
    ];
    return spr;
  }

  StepState _getState(int i) {
    if (_currentstep >= i) {
      return StepState.complete;
    } else {
      return StepState.disabled;
    }
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stepper Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StepperPage(),
    );
  }
}