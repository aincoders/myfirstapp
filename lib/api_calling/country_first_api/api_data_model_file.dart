class CountryInfo {
  int? countryId;
  String? name;
  String? supportedTaxType;
  int? phoneLength;
  int? taxNumberLimit;
  String? phonecode;
  String? currency;
  String? emoji;

  CountryInfo(
      {this.countryId,
        this.name,
        this.supportedTaxType,
        this.phoneLength,
        this.taxNumberLimit,
        this.phonecode,
        this.currency,
        this.emoji});

  CountryInfo.fromJson(Map<String, dynamic> json) {
    countryId = json['country_id'];
    name = json['name'];
    supportedTaxType = json['supported_tax_type'];
    phoneLength = json['phone_length'];
    taxNumberLimit = json['tax_number_limit'];
    phonecode = json['phonecode'];
    currency = json['currency'];
    emoji = json['emoji'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country_id'] = this.countryId;
    data['name'] = this.name;
    data['supported_tax_type'] = this.supportedTaxType;
    data['phone_length'] = this.phoneLength;
    data['tax_number_limit'] = this.taxNumberLimit;
    data['phonecode'] = this.phonecode;
    data['currency'] = this.currency;
    data['emoji'] = this.emoji;
    return data;
  }

  @override
  String toString() {
    return name ?? ''; // Return the title or an empty string if null
  }
}