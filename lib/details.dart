import 'package:flutter/cupertino.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height:180,width:double.infinity,
      child: Column(children: [
        Container( padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            Text('Severely Underweight',),
            Text('<=16.0'),
          ],),
        ),
        Container( padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Underweight',),
              Text('16.1~18.4'),
            ],),
        ),
        Container( padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Normalweight',),
              Text('18.5~24.9'),
            ],),
        ),
        Container( padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Overweight',),
              Text('25.0~39.9'),
            ],),
        ),
        Container( padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Obesity',),
              Text('32.0~39.9'),
            ],),
        ),
        Container( padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text('Super Obese',),
              Text('>=40.0'),
            ],),
        ),

      ],),
    );
  }
}
