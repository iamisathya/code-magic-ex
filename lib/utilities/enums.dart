enum EasyShipSortTypes {
  record,
  baNumber,
  name,
  orderId,
  date,
  time,
  total,
  totalPV
}

enum InventorySortTypes {
  itemCode,
  itemName,
  pv,
  price,
  quantityOnHand,
  totalAccumulatedPrice,
  totalPV
}

enum StockTypes { onHand, outOfStock }

enum OpenPoTypes {
  poNumber,
  date,
  time,
  totalPv,
  totalPrice,
  status,
  attachment,
}

enum CartUpdate {
  increament,
  decreament,
}

enum EasyShipTypes { orderNumber, period, productName, itemCode, pv, price }

enum SnackBarType {
  error,
  waring,
  success,
}

enum LocaleTypes {
  en,
  th,
  lo,
  km,
  ms,
}

enum DateSelectorType { startDate, endDate }

enum OrderStatus { pending, error, success, unknown }

enum TextTypes {
  headline1,
  headline2,
  headline3,
  headline4, //24
  headline5,
  headline6,
  subtitle1,
  subtitle2,
  bodyText1,
  bodyText2,
  caption,
  button,
  overline
}

enum OrderEntryItemFilters {
  allProduct,
  easyShipSet
}
