import 'package:water_overflow/Liquid.dart';

abstract class Container {
  double size;
  String name;
  List<Container> usualContainers;

  bool AddLiquid(Liquid liquid);
}