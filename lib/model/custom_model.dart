class CustomModel {
  String? main;

  CustomModel({
    this.main,
  });

  factory CustomModel.fromJson(Map<String, dynamic> json) => CustomModel(
        main: json['main'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'main': main,
      };
}
