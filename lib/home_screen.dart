import 'dart:math';

import 'package:bmi_calculator/result_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double  height = 100;
  int age  = 18 ;
  double  weight = 50;
  bool  isMale = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.5),
      appBar: AppBar(
          title: const Text('BMI Calculator'), backgroundColor: Colors.black),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 7, top: 10),
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: isMale? Colors.black:Colors.red, width: 10),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)),
                      child: InkWell(
                          onTap: (){
                            isMale = false;
                            setState(() {});
                          },
                          child: const Icon(Icons.female,size: 100,))
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15, right: 7, top: 10),
                    child: Container(
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: isMale?Colors.red:Colors.black, width: 10),
                          borderRadius: BorderRadius.circular(30)),
                      child: InkWell(
                          onTap: ( ) {
                            isMale = true;
                            setState(() {});
                          } ,
                          child: const Icon(Icons.male_outlined,size: 100,))
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(30)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'HEIGHT',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${height.toInt()}',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'cm',
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Slider(
                        value:height,
                        onChanged: (value) {
                          height = value;
                          setState(() {});
                        },
                        min: 100,
                        max: 200,
                        activeColor: Colors.red,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      children: [
                        const Text(
                          'WEIGHT',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 2,),
                        Text(
                          '${weight.toInt()}',
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                onPressed: () {
                                  weight--;
                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios_outlined,
                                  color: Colors.white,
                                )),
                            IconButton(
                                onPressed: () {
                                  weight++;
                                  setState(() {    });
                                },
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      children: [
                        const Text(
                          'AGE',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 2,),
                        Text(
                          '$age',
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                onPressed: () {
                                  age--;
                                  setState(() {
                                  });
                                },
                                icon: const Icon(
                                  Icons.arrow_back_ios_outlined,
                                  color: Colors.white,
                                )),
                            IconButton(
                                onPressed: () {
                                  age++;
                                  setState(() {});
                                },
                                icon: const Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: (){
                    double result = weight / pow(height/100,2);
                    print (result.round());

                      Navigator.push(context, MaterialPageRoute(
                          builder: (context)  {
                            return  ResultScreen(
                              height: height ,
                              weight: weight,
                              result: result,
                              age: age ,
                              gender:
                              isMale==true ?'male' : 'female',


                            );
                          }


                      ));




                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: const BorderSide(color: Colors.red))),
                  ),
                  child: const Text(
                    'CALCULATE',
                    style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 3,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}