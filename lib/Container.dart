import 'package:water_overflow/Liquid.dart';

abstract class Container {
  double size;
  String name;
  List<Container> usualContainers;

  bool AddLiquid(Liquid liquid);
}

class Cup implements Container{
  @override
  String name;

  @override
  double size;

  @override
  List<Container> usualContainers;

  @override
  bool AddLiquid(Liquid liquid) {
    // TODO: implement AddLiquid
    throw UnimplementedError();
  }

}
