class CityResponse {
  final String value;
  final String city;

  CityResponse({required this.value,required  this.city});

  static CityResponse fromJson(Map<String, dynamic> json){
    String value = json['value'] ?? '';
    Map<String, dynamic> dataJson = json['data'];
    String city = dataJson['city'] ?? '';

    return CityResponse(value: value, city: city);
  }

}