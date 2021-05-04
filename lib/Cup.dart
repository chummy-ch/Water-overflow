import 'package:water_overflow/Container.dart';
import 'package:water_overflow/Liquid.dart';

class Cup implements Container {
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
