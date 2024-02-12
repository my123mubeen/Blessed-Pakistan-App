// ignore_for_file: camel_case_types

class searches {
  final String userId;
  final String city;
  final String propertyType;
  final String minPrice;
  final String maxPrice;
  final String minArea;
  final String maxArea;

  searches({
    required this.userId,
    required this.city,
    required this.propertyType,
    required this.minPrice,
    required this.maxPrice,
    required this.minArea,
    required this.maxArea,
  });

  factory searches.fromJson(Map<String, dynamic> json) {
    return searches(
      userId: json['userid'],
      city: json['city'],
      propertyType: json['propertyType'],
      minPrice: json['min_price'],
      maxPrice: json['max_price'],
      minArea: json['min_area'],
      maxArea: json['max_area'],
    );
  }
}
