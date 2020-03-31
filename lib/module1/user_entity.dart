class UserEntity {
	String userPwd;
	String userEmail;
	String userName;
	int userId;

	UserEntity({this.userPwd, this.userEmail, this.userName, this.userId});

	UserEntity.fromJson(Map<String, dynamic> json) {
		userPwd = json['userPwd'];
		userEmail = json['userEmail'];
		userName = json['userName'];
		userId = json['userId'];
	}

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['userPwd'] = this.userPwd;
		data['userEmail'] = this.userEmail;
		data['userName'] = this.userName;
		data['userId'] = this.userId;
		return data;
	}
}
