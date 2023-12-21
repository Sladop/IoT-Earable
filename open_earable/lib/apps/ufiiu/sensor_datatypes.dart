class SensorDataType {
  Map<dynamic, dynamic> data;

  SensorDataType(this.data);

  double get x => data["X"];
  double get y => data["Y"];
  double get z => data["Z"];

  Map<String, String> get units => data["units"];
}

class Acceleration extends SensorDataType {
  Acceleration(Map<dynamic, dynamic> data) : super(data["ACC"]);
}

class Gyroscope extends SensorDataType {
  Gyroscope(Map<dynamic, dynamic> data) : super(data["GYRO"]);
}

class EulerAngles extends SensorDataType {
  EulerAngles(Map<dynamic, dynamic> data) : super(data["EULER"]);
}