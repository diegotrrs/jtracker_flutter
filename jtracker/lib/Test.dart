class Test {
  final String name;
  final String country;

  Test({this.name, this.country});

  factory Test.fromJson(Map<String, dynamic> json) {
    return Test(
      name: json['name'],
      country: json['country'],
    );
  }
}