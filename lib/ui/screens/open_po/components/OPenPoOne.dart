// ignore: file_names
class OpenPoOne {
  late String orderDscid;
  late String orderOpid;
  late String orderTotalPv;
  late String orderTotalPrice;
  late String orderDate;
  late String orderTime;
  late String orderStatus;
  late String iconAttachment;

  OpenPoOne(
      {required  this.orderDscid,
      required this.orderOpid,
      required this.orderTotalPv,
      required this.orderTotalPrice,
      required this.orderDate,
      required this.orderTime,
      required this.orderStatus,
      required this.iconAttachment});

  OpenPoOne.fromJson(Map<String, dynamic> json) {
    orderDscid = json['order_dscid']! as String;
    orderOpid = json['order_opid']! as String;
    orderTotalPv = json['order_total_pv']! as String;
    orderTotalPrice = json['order_total_price']! as String;
    orderDate = json['order_date']! as String;
    orderTime = json['order_time']! as String;
    orderStatus = json['order_status']! as String;
    iconAttachment = json['icon_attachment']! as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_dscid'] = this.orderDscid;
    data['order_opid'] = this.orderOpid;
    data['order_total_pv'] = this.orderTotalPv;
    data['order_total_price'] = this.orderTotalPrice;
    data['order_date'] = this.orderDate;
    data['order_time'] = this.orderTime;
    data['order_status'] = this.orderStatus;
    data['icon_attachment'] = this.iconAttachment;
    return data;
  }
}