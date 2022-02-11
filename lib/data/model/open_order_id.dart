class OpenPlaceOrderId {
  String orderId = "";
  String orderDscid = "";
  String orderOpid = "";
  String orderTotalPv = "";
  String orderTotalPrice = "";
  String orderDate = "";
  String orderStatus = "";
  String createBy = "";
  String createDate = "";
  String updateBy = "";
  String updateDate = "";
  String deleteBy = "";
  String deleteDate = "";
  String cusId = "";
  String soId = "";
  String comment = "";
  String isPrint = "";
  String printedBy = "";
  String lastUpdate = "";

  OpenPlaceOrderId(
      {this.orderId = "",
      this.orderDscid = "",
      this.orderOpid = "",
      this.orderTotalPv = "",
      this.orderTotalPrice = "",
      this.orderDate = "",
      this.orderStatus = "",
      this.createBy = "",
      this.createDate = "",
      this.updateBy = "",
      this.updateDate = "",
      this.deleteBy = "",
      this.deleteDate = "",
      this.cusId = "",
      this.soId = "",
      this.comment = "",
      this.isPrint = "",
      this.printedBy = "",
      this.lastUpdate = ""});

  OpenPlaceOrderId.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'] as String;
    orderDscid = json['order_dscid'] as String;
    orderOpid = json['order_opid'] as String;
    orderTotalPv = json['order_total_pv'] as String;
    orderTotalPrice = json['order_total_price'] as String;
    orderDate = json['order_date'] as String;
    orderStatus = json['order_status'] as String;
    createBy = json['create_by'] as String;
    createDate = json['create_date'] as String;
    updateBy = json['update_by'] as String;
    updateDate = json['update_date'] as String;
    deleteBy = json['delete_by'] as String;
    deleteDate = json['delete_date'] as String;
    cusId = json['cus_id'] as String;
    soId = json['so_id'] as String;
    comment = json['comment'] as String;
    isPrint = json['is_print'] as String;
    printedBy = json['printed_by'] as String;
    lastUpdate = json['last_update'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['order_dscid'] = orderDscid;
    data['order_opid'] = orderOpid;
    data['order_total_pv'] = orderTotalPv;
    data['order_total_price'] = orderTotalPrice;
    data['order_date'] = orderDate;
    data['order_status'] = orderStatus;
    data['create_by'] = createBy;
    data['create_date'] = createDate;
    data['update_by'] = updateBy;
    data['update_date'] = updateDate;
    data['delete_by'] = deleteBy;
    data['delete_date'] = deleteDate;
    data['cus_id'] = cusId;
    data['so_id'] = soId;
    data['comment'] = comment;
    data['is_print'] = isPrint;
    data['printed_by'] = printedBy;
    data['last_update'] = lastUpdate;
    return data;
  }
}
