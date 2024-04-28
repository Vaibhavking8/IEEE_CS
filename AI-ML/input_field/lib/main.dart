import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        title: 'Input_Field',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.orangeAccent),
          ),
        home: OnChanged(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var input;
  var result="";
  void change(){
    result = input;
    notifyListeners();
  }

}

class OnChanged extends StatefulWidget {
  const OnChanged({super.key});

  @override
  State<OnChanged> createState() => _OnChangedState();
}

class _OnChangedState extends State<OnChanged> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
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
                  title: Text("Input Field"),
                ),
                SizedBox(height: 50),
                Field(controller: _controller),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    appState.change();
                  },
                  child: Text("Show"),
                ),
                SizedBox(height: 40),
                Output(appState: appState)
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
        child: Text('Text: ${appState.result}', 
          style: style
          ),
      )
      );
  }
}

class Field extends StatelessWidget {
  const Field({
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
            label: Text("Enter a Text"),
          ),
          controller: _controller,
          onChanged: (String value) async {
              appState.input=value;
          },
        ),
      ),
    );
  }
}
