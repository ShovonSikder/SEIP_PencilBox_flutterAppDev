class BmiSuggestion {
  String comment;
  String range;

  BmiSuggestion({required this.comment, required this.range});
}

final bmiCommentList = <BmiSuggestion>[
  BmiSuggestion(comment: 'Underweight (Severe thinness)', range: '< 16.0'),
  BmiSuggestion(
      comment: 'Underweight (Moderate thinness)', range: '16.0 – 16.9'),
  BmiSuggestion(comment: 'Underweight (Mild thinness)', range: '17.0 – 18.4'),
  BmiSuggestion(comment: 'Normal range', range: '18.5 – 24.9'),
  BmiSuggestion(comment: 'Overweight (Pre-obese)', range: '25.0 – 29.9'),
  BmiSuggestion(comment: 'Obese (Class I)', range: '30.0 – 34.9'),
  BmiSuggestion(comment: 'Obese (Class II)', range: '35.0 – 39.9'),
  BmiSuggestion(comment: 'Obese (Class III)', range: '≥ 40.0'),
];
