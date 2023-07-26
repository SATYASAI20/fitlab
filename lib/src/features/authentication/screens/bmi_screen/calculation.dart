import 'dart:math';

/// algorithm
class Logic {
  
  double calculateBMI(int height, int weight) {
    double bmi = weight / pow(height / 100, 2);
    return bmi;
  }
}
