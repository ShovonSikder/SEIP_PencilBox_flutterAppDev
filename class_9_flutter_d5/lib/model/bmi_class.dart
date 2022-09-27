class Bmi {
  double bmiValue;
  String imgPath = '';

  Bmi({required this.bmiValue});

  String getComment() {
    if (bmiValue < 16.0) {
      imgPath = 'images/normal.png';
      return 'Underweight (Severe thinness)';
    } else if (bmiValue < 17.0) {
      imgPath = 'images/normal.png';
      return 'Underweight (Moderate thinness)';
    } else if (bmiValue < 18.5) {
      imgPath = 'images/normal.png';
      return 'Underweight (Mild thinness)';
    } else if (bmiValue < 25.0) {
      imgPath = 'images/normal.png';
      return 'Normal range';
    } else if (bmiValue < 30.0) {
      imgPath = 'images/overweight.png';
      return 'Overweight (Pre-obese)';
    } else if (bmiValue < 35.0) {
      imgPath = 'images/obese.png';
      return 'Obese (Class I)';
    } else if (bmiValue < 40.0) {
      imgPath = 'images/overobese.png';
      return 'Obese (Class II)';
    } else {
      imgPath = 'images/morbidlyobese.png';
      return 'Obese (Class III)';
    }
  }
}
