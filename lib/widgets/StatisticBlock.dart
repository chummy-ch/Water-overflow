import 'package:flutter/material.dart';

class StatisticBlock{
  static printStatistic(){
    return Column(
      children: [
        Row(
          children: [
            Text('Weekly average'),
            Text('ml/day'),
          ],
        ),
        Row(
          children: [
            Text('Monthly average'),
            Text('ml/day'),
          ],
        ),
        Row(
          children: [
            Text('Average completion'),
            Text('%'),
          ],
        ),
        Row(
          children: [
            Text('Favorite drink'),
            Text(''),
          ],
        ),
        Row(
          children: [
            Text('Drink frequency'),
            Text('times/day'),
          ],
        ),
      ],
    );
  }
}