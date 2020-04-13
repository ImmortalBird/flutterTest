import 'package:cashier/model/pay_channel_entity.dart';

payChannelEntityFromJson(PayChannelEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code']?.toInt();
	}
	if (json['msg'] != null) {
		data.msg = json['msg']?.toString();
	}
	if (json['data'] != null) {
		data.data = new PayChannelData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> payChannelEntityToJson(PayChannelEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	if (entity.data != null) {
		data['data'] = entity.data.toJson();
	}
	return data;
}

payChannelDataFromJson(PayChannelData data, Map<String, dynamic> json) {
	if (json['orderAmt'] != null) {
		data.orderAmt = json['orderAmt']?.toString();
	}
	if (json['payChannels'] != null) {
		data.payChannels = new List<PayChannelDataPayChannel>();
		(json['payChannels'] as List).forEach((v) {
			data.payChannels.add(new PayChannelDataPayChannel().fromJson(v));
		});
	}
	return data;
}

Map<String, dynamic> payChannelDataToJson(PayChannelData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['orderAmt'] = entity.orderAmt;
	if (entity.payChannels != null) {
		data['payChannels'] =  entity.payChannels.map((v) => v.toJson()).toList();
	}
	return data;
}

payChannelDataPayChannelFromJson(PayChannelDataPayChannel data, Map<String, dynamic> json) {
	if (json['channelCode'] != null) {
		data.channelCode = json['channelCode']?.toString();
	}
	if (json['channelName'] != null) {
		data.channelName = json['channelName']?.toString();
	}
	if (json['sn'] != null) {
		data.sn = json['sn']?.toString();
	}
	if (json['isDefault'] != null) {
		data.isDefault = json['isDefault']?.toString();
	}
	return data;
}

Map<String, dynamic> payChannelDataPayChannelToJson(PayChannelDataPayChannel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['channelCode'] = entity.channelCode;
	data['channelName'] = entity.channelName;
	data['sn'] = entity.sn;
	data['isDefault'] = entity.isDefault;
	return data;
}