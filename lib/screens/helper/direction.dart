

double getDirection(double oldDirection){
  double direct = 0;
  double min = 999;
  for(int i = 0; i < _maps.length; ++i){
    double current = 0;
    if(oldDirection < 0 && _maps[i].value < 0){
      current = (oldDirection.abs() - _maps[i].value.abs()).abs();
    } else if(oldDirection > 0 && _maps[i].value > 0){
      current = (oldDirection - _maps[i].value).abs();
    } else {
      current = (oldDirection.abs() + _maps[i].value.abs()).abs();
    }
    if(current < min){
      min = current;
      direct = _maps[i].key;
    }
  }

  return direct;
}

final List<MyMap> _maps = [
  MyMap(-20,-136.12700023487815),
  MyMap(-19,-93.320650223),
  MyMap(-18,-50.514300211),
  MyMap(-17,-7.7079501996),
  MyMap(-16,35.0983998120),
  MyMap(-15,77.9047498238),
  MyMap(-14,120.711099835),
  MyMap(-13,163.517449847),
  MyMap(-12,-153.67620014),
  MyMap(-11,-110.86985012),
  MyMap(-10,-68.063500117),
  MyMap(-9,-25.2571501056),
  MyMap(-8,17.54919990604),
  MyMap(-7,60.35554991779),
  MyMap(-6,103.1618999295),
  MyMap(-5,145.9682499412),
  MyMap(-4,-171.225400046),
  MyMap(-3,-128.419050035),
  MyMap(-2,-85.6127000234),
  MyMap(-1,-42.8063500117),
  MyMap(0,0.0),
  MyMap(1,42.806350011743),
  MyMap(2,85.612700023487),
  MyMap(3,128.41905003523),
  MyMap(4,171.22540004697),
  MyMap(5,-145.9682499412),
  MyMap(6,-103.1618999295),
  MyMap(7,-60.35554991779),
  MyMap(8,-17.54919990604),
  MyMap(9,25.257150105698),
  MyMap(10,68.06350011743),
  MyMap(11,110.8698501291),
  MyMap(12,153.6762001409),
  MyMap(13,-163.517449847),
  MyMap(14,-120.711099835),
  MyMap(15,-77.9047498238),
  MyMap(16,-35.0983998120),
  MyMap(17,7.707950199649),
  MyMap(18,50.51430021139),
  MyMap(19,93.32065022313),
  MyMap(20,136.1270002348),
];

class MyMap{
  final double key;
  final double value;

  MyMap(this.key, this.value);
}