import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../calculator_brain.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';
import '../components/rounded_icon_button.dart';
import 'results_page.dart';

const Color inactiveCardColor = Color(0XFF111328);
const Color activeCardColor = Color(0XFF1D1E33);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedGender = Gender.male;
                              });
                            },
                            child: ReusableCard(
                              cardColor: selectedGender == Gender.male
                                  ? activeCardColor
                                  : inactiveCardColor,
                              cardChild: IconContent(
                                  icon: FontAwesomeIcons.mars, label: "MALE"),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedGender = Gender.female;
                              });
                            },
                            child: ReusableCard(
                              cardColor: selectedGender == Gender.female
                                  ? activeCardColor
                                  : inactiveCardColor,
                              cardChild: IconContent(
                                  icon: FontAwesomeIcons.venus,
                                  label: "FEMALE"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: ReusableCard(
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "HEIGHT",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            textBaseline: TextBaseline.alphabetic,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            children: [
                              Text(
                                height.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.copyWith(fontWeight: FontWeight.w900),
                              ),
                              SizedBox(width: 4),
                              Text(
                                "cm",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Slider(
                            value: height.toDouble(),
                            label: height.toString(),
                            min: 120,
                            max: 220,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: ReusableCard(
                            cardChild: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "WEIGHT",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                SizedBox(height: 12),
                                Text(
                                  weight.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge
                                      ?.copyWith(fontWeight: FontWeight.w900),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RoundedIconButton(
                                      icon: FontAwesomeIcons.minus,
                                      onPress: () {
                                        setState(() {
                                          weight--;
                                        });
                                      },
                                    ),
                                    SizedBox(width: 16),
                                    RoundedIconButton(
                                      icon: FontAwesomeIcons.plus,
                                      onPress: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                            child: ReusableCard(
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "AGE",
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              SizedBox(height: 12),
                              Text(
                                age.toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.copyWith(fontWeight: FontWeight.w900),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RoundedIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPress: () {
                                      setState(() {
                                        age--;
                                      });
                                    },
                                  ),
                                  SizedBox(width: 16),
                                  RoundedIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPress: () {
                                      setState(() {
                                        age++;
                                      });
                                    },
                                  )
                                ],
                              )
                            ],
                          ),
                        )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultsPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.getInterpretation(),
                );
              }));
            },
            child: Container(
              color: Color(0XFFEB1555),
              padding: EdgeInsets.only(bottom: 20),
              height: 100,
              width: double.infinity,
              child: Center(
                  child: Text(
                'CALCULATE',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              )),
            ),
          )
        ],
      ),
    );
  }
}
