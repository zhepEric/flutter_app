class AreaCodeEntity {
	String callingCode;
	String countryCode;
	String name;
	String logo;
	String sortCode;

	AreaCodeEntity({this.callingCode, this.countryCode, this.name, this.logo, this.sortCode});

	AreaCodeEntity.fromJson(Map<String, dynamic> json) {
		callingCode = json['callingCode'];
		countryCode = json['countryCode'];
		name = json['name'];
		logo = json['logo'];
		sortCode = json['sortCode'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['callingCode'] = this.callingCode;
		data['countryCode'] = this.countryCode;
		data['name'] = this.name;
		data['logo'] = this.logo;
		data['sortCode'] = this.sortCode;
		return data;
	}
}
