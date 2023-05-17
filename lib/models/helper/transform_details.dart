class TransformDetails {
  late double x;
  late double y;
  late double scale;
  TransformDetails(){
    x = 0;
    y = 0;
    scale = 1;
  }

  void set(double x, double y, double scale){
    this.x = x;
    this.y = y;
    this.scale = scale;
  }
}