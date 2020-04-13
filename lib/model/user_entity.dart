import 'package:cashier/generated/json/base/json_convert_content.dart';

class UserEntity with JsonConvert<UserEntity> {
	int code;
	String msg;
	UserData data;
}

class UserData with JsonConvert<UserData> {
	List<UserDataBanner> banner;
	UserDataUserInfo userInfo;
}

class UserDataBanner with JsonConvert<UserDataBanner> {
	String imgUrl;
	String redirectUrl;
	String title;
	String sort;
}

class UserDataUserInfo with JsonConvert<UserDataUserInfo> {
	String userName;
	String headImgUrl;
	int isKzpActivated;
	String kzpAmtUsable;
}
