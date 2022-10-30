// ignore_for_file: prefer_const_constructors, deprecated_member_use, avoid_print

import 'package:flutter/material.dart';
import 'package:function_tree/function_tree.dart';
void main()
{
  runApp(Calculator());
}


class Calculator extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp
    (
        debugShowCheckedModeBanner: false,
        title:'Calculator' ,
        home: SimpleCalculator(),
    );
  }
}

class SimpleCalculator extends StatefulWidget {
 

  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String equation ="0";
  String result = "0";
  buttonPressed(String buttonName)
  {
   setState(() {
     if(buttonName == "C")
     {
       equation = "0";
       result = "0";

     }else if(buttonName == "X")
     {
       equation  = equation.substring(0,equation.length-1);
       if(equation == "")
       {
         equation = "0";
       }
     }
     else if(buttonName == "=")
     {
      
        var temp_result  = equation.interpret();
         result= temp_result.toString();
     }
     else{
       if(equation == "0")
       {
         equation = buttonName;
       }
       else{
          equation = equation + buttonName;
       }
     }

   });
  }
  Widget buildButton(String buttonName,double buttonHeight,Color buttonColor)
  {
    return  Container(
                          height: MediaQuery.of(context).size.height*0.1*buttonHeight,
                          color: buttonColor,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0),
                            side: BorderSide(
                              color: Colors.white,
                              width: 1,
                              style: BorderStyle.solid
                            )
                            ),
                            onPressed: ()=> buttonPressed(buttonName),
                             child: Text(buttonName,style: TextStyle(
                               color: Colors.white,
                               fontSize: 30.0,
                               fontWeight:FontWeight.normal,
                              
                             ),)
                          ),
                        );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Calculator'))),
      body:Column(
      
       children: [
         Container(
          
           alignment:Alignment.centerRight,
           padding:EdgeInsets.fromLTRB(10, 20, 10, 0),
           child:Text(equation,style: TextStyle(fontSize:48.0)),
          ) ,//Input ko laagi 
          Container(
            alignment: Alignment.centerRight,
            padding:EdgeInsets.fromLTRB(10, 30, 10, 0),
            child: Text(result,style: TextStyle(fontSize: 48.0),),

          ),//result ko laagi
          Expanded(child: Divider()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width:MediaQuery.of(context).size.width*.75,
                
               
                child: Table(
                  children: [
                    TableRow(
                      children: [
                       buildButton("C",1, Colors.redAccent),
                       buildButton("X",1, Colors.blue),
                       buildButton("/",1, Colors.blue),
                      ]
                    ),
                     TableRow(
                      children: [
                       buildButton("7",1, Colors.black54),
                       buildButton("8",1, Colors.black54),
                       buildButton("9",1, Colors.black54),
                      ]
                    ),
                    TableRow(
                      children: [
                       buildButton("4",1, Colors.black54),
                       buildButton("5",1, Colors.black54),
                       buildButton("6",1, Colors.black54),
                      ]
                    ),
                    TableRow(
                      children: [
                       buildButton("1",1, Colors.black54),
                       buildButton("2",1, Colors.black54),
                       buildButton("3",1, Colors.black54),
                      ]
                    ),
                     TableRow(
                      children: [
                       buildButton(".",1, Colors.black54),
                       buildButton("0",1, Colors.black54),
                       buildButton("00",1, Colors.black54),
                      ]
                    )
                  ]
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.25,
                child: Table(
                  children: [
                   TableRow(
                     children: [
                       buildButton("*", 1, Colors.blue)
                     ]
                   ),
                    TableRow(
                     children: [
                       buildButton("-", 1, Colors.blue)
                     ]
                   ),
                    TableRow(
                     children: [
                       buildButton("+", 1, Colors.blue)
                     ]
                   ),
                    TableRow(
                     children: [
                       buildButton("=", 2, Colors.blue)
                     ]
                   ),
                  ],
                ),
              )
            ],
          )

       ],
      )
    );
  }
}