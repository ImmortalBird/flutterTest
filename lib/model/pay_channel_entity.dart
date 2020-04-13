import 'package:cashier/generated/json/base/json_convert_content.dart';

class PayChannelEntity with JsonConvert<PayChannelEntity> {
	int code;
	String msg;
	PayChannelData data;
}

class PayChannelData with JsonConvert<PayChannelData> {
	String orderAmt;
	List<PayChannelDataPayChannel> payChannels;
}

class PayChannelDataPayChannel with JsonConvert<PayChannelDataPayChannel> {
	String channelCode;
	String channelName;
	String sn;
	String isDefault;
}
