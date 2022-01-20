import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';

const bottomContainerHeight = 80.0;
const activeCardColor = Color(0xFF1d1e33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;

  //1 = male, 2 = female
  void updateColor(Gender gender) {
    if (gender == Gender.male) {
      if (maleCardColor == activeCardColor) {
        maleCardColor = inactiveCardColor;
      } else {
        maleCardColor = activeCardColor;
        femaleCardColor = inactiveCardColor;
      }
    } else {
      if (femaleCardColor == activeCardColor) {
        femaleCardColor = inactiveCardColor;
      } else {
        maleCardColor = inactiveCardColor;
        femaleCardColor = activeCardColor;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        print('Male card was pressed');
                        setState(() {
                          updateColor(Gender.male);
                        });
                      },
                      child: ReusableCard(
                        color: maleCardColor,
                        cardChild: IconContent(
                          cardIcon: FontAwesomeIcons.mars,
                          cardText: 'MALE',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        print('Female card was pressed');
                        setState(() {
                          updateColor(Gender.female);
                        });
                      },
                      child: ReusableCard(
                        color: femaleCardColor,
                        cardChild: IconContent(
                          cardIcon: FontAwesomeIcons.venus,
                          cardText: 'FEMALE',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ReusableCard(color: activeCardColor),
            ),
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: ReusableCard(color: activeCardColor),
                  ),
                  Expanded(
                    child: ReusableCard(
                      color: activeCardColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: bottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: bottomContainerHeight,
            )
          ],
        ),
      ),
    );
  }
}
