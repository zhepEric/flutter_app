class CountryBeanEntity {
	List<CountryBeanResult> result;
	String message;
	String status;

	CountryBeanEntity({this.result, this.message, this.status});

	CountryBeanEntity.fromJson(Map<String, dynamic> json) {
		if (json['result'] != null) {
			result = new List<CountryBeanResult>();(json['result'] as List).forEach((v) { result.add(new CountryBeanResult.fromJson(v)); });
		}
		message = json['message'];
		status = json['status'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		if (this.result != null) {
      data['result'] =  this.result.map((v) => v.toJson()).toList();
    }
		data['message'] = this.message;
		data['status'] = this.status;
		return data;
	}
}

class CountryBeanResult {
	String callingCode;
	String countryCode;
	String name;
	String logo;
	String sortCode;

	CountryBeanResult({this.callingCode, this.countryCode, this.name, this.logo, this.sortCode});

	CountryBeanResult.fromJson(Map<String, dynamic> json) {
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
