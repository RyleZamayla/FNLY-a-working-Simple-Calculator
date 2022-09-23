import 'package:flutter/material.dart';
import 'package:desperate_calculator/desperation_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: const Calculator(name: 'Basic Calculator'),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key, required this.name});
  final String name;
  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  var calculate = '';
  var operator = '';

  insertNumber(value){
    setState(() {
      calculate +=value;
    });
  }
  setOperator(value){
    setState(() {
      operator = value;
      calculate +=value;
    });
  }
  clearOperation(){
    setState(() {
      calculate='';
    });
  }

  calculator() {
    var data = calculate.split(operator);

    var number1 = data[0];
    var number2 = data[1];

    setState(() {
      switch(operator) {
        case '*':
          calculate = (double.parse(number1) * double.parse(number2)).toStringAsFixed(1);
          break;
        case '/':
          calculate = (double.parse(number1) / double.parse(number2)).toStringAsFixed(1);
          break;
        case '-':
          calculate = (double.parse(number1) - double.parse(number2)).toStringAsFixed(1);
          break;
        case '+':
          calculate = (double.parse(number1) + double.parse(number2)).toStringAsFixed(1);
          break;
      }
    });
  }

  backspaceOperation(){
    setState(() {
      if (calculate.isNotEmpty) {
        calculate = calculate.substring(0, calculate.length-1);
      }
    });
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Angel\'s Calculator '),
      // ),
      body: Container(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * .48,
                  color: Colors.black,
                  child: Container(
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.only(right: 24, bottom: 24),
                    child:  Text(
                      (calculate.isEmpty) ? '0' : calculate,
                      style: TextStyle(color: Colors.white, fontSize: 68),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
                            child: CalculatorButton(label: "clear", onTap: (){
                              clearOperation();
                            }, size: 35, backgroundColor: Colors.black, foregroundColor:Colors.orange, borderColor: Colors.black),
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: CalculatorButton(label: "Backspace", onTap: (){
                              backspaceOperation();
                            }, size: 35, backgroundColor: Colors.orange, foregroundColor: Colors.black, borderColor: Colors.black),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                            child: CalculatorButton(label: "7", onTap: (){
                              insertNumber('7');
                            }, size: 35),
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                            child: CalculatorButton(label: "8", onTap: (){
                              insertNumber('8');
                            }, size: 35),
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                            child: CalculatorButton(label: "9", onTap: (){
                              insertNumber('9');

                            }, size: 35),
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                            child: CalculatorButton(label: "+", onTap: (){
                              setOperator('+');
                            }, size: 35),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                            child: CalculatorButton(label: "4", onTap: (){
                              insertNumber('4');

                            }, size: 35),
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                            child: CalculatorButton(label: "5", onTap: (){
                              insertNumber('5');

                            }, size: 35),
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                            child: CalculatorButton(label: "6", onTap: (){
                              insertNumber('6');

                            }, size: 35),
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                            child: CalculatorButton(label: "-", onTap: (){
                              setOperator('-');


                            }, size: 35),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                            child: CalculatorButton(label: "1", onTap: (){
                              insertNumber('1');

                            }, size: 35),
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                            child: CalculatorButton(label: "2", onTap: (){
                              insertNumber('2');

                            }, size: 35),
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                            child: CalculatorButton(label: "3", onTap: (){
                              insertNumber('3');

                            }, size: 35),
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                            child: CalculatorButton(label: "*", onTap: (){
                              setOperator('*');


                            }, size: 35),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                            child: CalculatorButton(label: "0", onTap: (){
                              insertNumber('0');

                            }, size: 35),
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                            child: CalculatorButton(label: ".", onTap: (){
                              insertNumber('.');

                            }, size: 35),
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                            child: CalculatorButton(label: "=", onTap: (){
                              calculator();
                            }, size: 35),
                          ),
                          Padding(padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                            child: CalculatorButton(label: "/", onTap: (){
                              setOperator('/');

                            }, size: 35),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ]
          )
      ),
    );
  }
}



