import 'package:cashier/model/user_entity.dart';

userEntityFromJson(UserEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new UserData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> userEntityToJson(UserEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

userDataFromJson(UserData data, Map<String, dynamic> json) {
	if (json['banner'] != null) {
		data.banner = new List<UserDataBanner>();
		(json['banner'] as List).forEach((v) {
			data.banner.add(new UserDataBanner().fromJson(v));
		});
	}
	if (json['userInfo'] != null) {
		data.userInfo = new UserDataUserInfo().fromJson(json['userInfo']);
	}
	return data;
}

Map<String, dynamic> userDataToJson(UserData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	if (entity.banner != null) {
		data['banner'] =  entity.banner.map((v) => v.toJson()).toList();
	}
	if (entity.userInfo != null) {
		data['userInfo'] = entity.userInfo.toJson();
	}
	return data;
}

userDataBannerFromJson(UserDataBanner data, Map<String, dynamic> json) {
	if (json['imgUrl'] != null) {
		data.imgUrl = json['imgUrl']?.toString();
	}
	if (json['redirectUrl'] != null) {
		data.redirectUrl = json['redirectUrl']?.toString();
	}
	if (json['title'] != null) {
		data.title = json['title']?.toString();
	}
	if (json['sort'] != null) {
		data.sort = json['sort']?.toString();
	}
	return data;
}

Map<String, dynamic> userDataBannerToJson(UserDataBanner entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['imgUrl'] = entity.imgUrl;
	data['redirectUrl'] = entity.redirectUrl;
	data['title'] = entity.title;
	data['sort'] = entity.sort;
	return data;
}

userDataUserInfoFromJson(UserDataUserInfo data, Map<String, dynamic> json) {
	if (json['userName'] != null) {
		data.userName = json['userName']?.toString();
	}
	if (json['headImgUrl'] != null) {
		data.headImgUrl = json['headImgUrl']?.toString();
	}
	if (json['isKzpActivated'] != null) {
		data.isKzpActivated = json['isKzpActivated']?.toInt();
	}
	if (json['kzpAmtUsable'] != null) {
		data.kzpAmtUsable = json['kzpAmtUsable']?.toString();
	}
	return data;
}

Map<String, dynamic> userDataUserInfoToJson(UserDataUserInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['userName'] = entity.userName;
	data['headImgUrl'] = entity.headImgUrl;
	data['isKzpActivated'] = entity.isKzpActivated;
	data['kzpAmtUsable'] = entity.kzpAmtUsable;
	return data;
}