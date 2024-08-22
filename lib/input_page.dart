import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'icon_content.dart';
import 'reusable_card.dart';

const Color inactiveCardColor = Color(0XFF111328);
const Color activeCardColor = Color(0XFF1D1E33);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    int height = 180;
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
                          min: 120,
                          max: 220,
                          onChanged: (height) {},
                        )
                      ],
                    ),
                  )),
                  SizedBox(height: 16),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child: ReusableCard()),
                        SizedBox(width: 16),
                        Expanded(child: ReusableCard()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 16),
          Container(
            color: Color(0XFFEB1555),
            height: 100,
            width: double.infinity,
          )
        ],
      ),
    );
  }
}
