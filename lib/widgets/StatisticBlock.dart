import 'package:flutter/material.dart';
import 'package:water_overflow/utils/Constants.dart';

class StatisticBlock{
  static printStatistic(){
    double h = 55;
    return Column(
      children: [
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Weekly average', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),),
            Text('ml/day', style: TEXT_THEME.headline4,),
          ],
        ),
        SizedBox(height: h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Monthly average', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),),
            Text('ml/day', style: TEXT_THEME.headline4,),
          ],
        ),
        SizedBox(height: h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Average completion', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),),
            Text('%', style: TEXT_THEME.headline4,),
          ],
        ),
        SizedBox(height: h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Favorite drink', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),),
            Text('', style: TEXT_THEME.headline4,),
          ],
        ),
        SizedBox(height: h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Drink frequency', style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),),
            Text('times/day', style: TEXT_THEME.headline4,),
          ],
        ),
      ],
    );
  }
}