import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:format/format.dart';

void main() async{
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Calculator_Basic',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
          ),
        home: OnChanged(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var num;
  var val1;
  var val2;
  
  void add(){
    if (val1!=null && val2!=null)
      num=val1+val2;
    else
    num = null;
    notifyListeners();
  }
  void subtract(){
    if (val1!=null && val2!=null)
    num=val1-val2;
    else
    num = null;
    notifyListeners();
  }
  void multiply(){
    if (val1!=null && val2!=null)
    num=val1*val2;
    else
    num = null;
    notifyListeners();
  }
  void division(){
    if (val1!=null && val2!=null)
    num=format('{:.2f}', val1/val2);
    else
    num = null;
    notifyListeners();
  }

}

class OnChanged extends StatefulWidget {
  const OnChanged({super.key});

  @override
  State<OnChanged> createState() => _OnChangedState();
}

class _OnChangedState extends State<OnChanged> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height: 30),
                AppBar(
                  centerTitle: true,
                  foregroundColor: Colors.amber,
                  backgroundColor: Colors.blueAccent,
                  title: Text("Calculator Basic"),
                ),
                SizedBox(height: 50),
                Field1(controller: _controller1),
                SizedBox(height: 40),
                Field2(controller: _controller2),
                SizedBox(height: 40),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        appState.add();
                      },
                      child: Icon(Icons.add),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: (){
                        appState.subtract();
                      },
                      child: Icon(Icons.remove),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: (){
                        appState.multiply();
                      },
                      child: Icon(Icons.close),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: (){
                        appState.division();
                      },
                      child: Icon(CupertinoIcons.divide),
                    )
                  ],
                ),
                SizedBox(height: 40),
                if (appState.num!=null)
                Output(appState: appState)
                else
                Output_()
              ],
            ),
          ),
        );
      }
    );
  }
}

class Output extends StatelessWidget {
  const Output({
    super.key,
    required this.appState,
  });

  final MyAppState appState;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); 
    final style = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary,
    );  
    return Card(
      color: theme.colorScheme.primary,  
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Answer is ${appState.num}', 
          style: style
          ),
      )
      );
  }
}

class Output_ extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); 
    final style = theme.textTheme.displaySmall!.copyWith(
      color: theme.colorScheme.onPrimary,
    );  
    return Card(
      color: theme.colorScheme.primary,  
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text('Output: ', 
          style: style
          ),
      )
      );
  }
}

class Field2 extends StatelessWidget {
  const Field2({
    super.key,
    required TextEditingController controller,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final theme = Theme.of(context); 

    return Card(
      color: theme.colorScheme.background,
      child: SizedBox(
        width: 200,
        child: TextField(
          decoration: InputDecoration(
            label: Text("Enter a number"),
          ),
          controller: _controller,
          onChanged: (String value) async {
            try {
              var n = int.parse(value);
              appState.val2=n;
            } 
            on FormatException {
              appState.val2=null;
            }
          },
        ),
      ),
    );
  }
}

class Field1 extends StatelessWidget {
  const Field1({
    super.key,
    required TextEditingController controller,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final theme = Theme.of(context); 
    return Card(
      color: theme.colorScheme.background,
      child: SizedBox(
        width: 200,
        child: TextField(
          decoration: InputDecoration(
            label: Text("Enter a number"),
          ),
          controller: _controller,
          onChanged: (String value) async {
            try {
              var n = int.parse(value);
              appState.val1=n;
            } 
            on FormatException {
              appState.val1=null;
            }
          },
        ),
      ),
    );
  }
}
