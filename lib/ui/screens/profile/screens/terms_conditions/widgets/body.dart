import 'package:dsc_tools/constants/colors.dart';
import 'package:dsc_tools/ui/global/theme/text_view.dart';
import 'package:dsc_tools/ui/global/widgets/page_title.dart';
import 'package:dsc_tools/utilities/enums.dart';
import 'package:dsc_tools/utilities/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'title_bar.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          PageTitle(title: "account".tr),
          TitleBar(
              title: "terms_and_conditions".tr,
              icon: kProfileUserEditPencilIcon),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: SvgPicture.asset(kProfileTermsConditionImage),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: AppText(
                text: "retail_purchasing_program".tr,
                style: TextTypes.headline4),
          ),
          Container(
              color: AppColor.brightGrayThird,
              padding: const EdgeInsets.all(20),
              child: const AppText(text: """
A Retail Customer may order products directly from Unicity pursuant to the ordering guidelines as follows:

1)    The Retail Customer may contact to make an order with Sale Support of Unicity by providing an ID Number of the recommending Distributor. At that time, a unique Customer ID number will be provided exclusively for that Retail Customer.

2)    The responsibility for the proper crediting of Volume generated on any Retail Customer order lies with the referring Distributor and not with Unicity or its employees.

3)    The Distributor is responsible for paying Unicity the expenses of a product return or credit-card chargeback. Should the Retail Customer initiate a product return or credit-card chargeback, the Distributor agrees that Unicity may debit from the Distributor’s cheque/commission all reasonable expenses incurred. Unicity may also suspend the Distributor’s ordering privileges and assess a chargeback handling fee of 1,000 Baht (One thousand Baht).

4)    The difference between the wholesale price and the retail price will be paid to the Distributor in accordance with the Distributor Number notified by the Retail Customer who made the purchase. The Distributor must have PV points at least the minimum requirement under the Compensation Plan in the Volume Month. The Distributor will receive PV points for the purchase made by the retail Customer which the orders are received and paid in the same Volume Month.

Retail Customer Product Satisfaction Guarantee

Unicity requires that Distributors provide Retail Customers information regarding the policy on product satisfaction guarantee of Retail Customer (“Guarantee Policy”). In this connection, retail customer can return products within seven (7) days starting from the date of product receiving by Retail Customer by submitting letter of intention within such period of seven (7) days to the Distributor, and Distributor of Unicity shall refund for the full amount of money paid by Retail Customer for such product to the Retail Customer within fifteen (15) days starting from the date of receiving such letter of intention for refund. This guarantee shall not include products damaged by intention or due to incorrect use.   

When selling product, the Distributor shall deliver a document of official receipt of Unicity to the Retail Customer, as well as specify the name and the address of Retail Customer, as well as name and ID Number of the Distributor of Unicity in the receipt completely. The receipt shall have notification determined in writing behind clearly with text as follows:

“Retail Customer Product Satisfaction Guarantee

Distributor of Unicity shall sell products under the list determined on another side of the receipt, providing refund guarantee 100% for you as a retail customer based on the Policy on Product Satisfaction Guarantee of Retail Customer of Unicity within seven (7) days, starting from the date of product receiving. If you are not satisfied with products bought from Unicity in any case, you can request for product change or refund from the Distributor of Unicity selling such product to you. The Distributor of Unicity can change products or refund fully amount money to you as requested within fifteen (15) days starting from the date of such product change or refund request. Proof of evidence used for product change or refund request includes receipt in detail of the product to be cancelled or product to be changed signed by you with reason supporting such cancellation or product change, as well as some unused part of product and containing package must be delivered to the Distributor of Unicity after receiving the product requested to change or refund from a Distributor of Unicity. You must prepare a letter certificating that you have received the product requested to change or refunded with fully amount of money duly provide to the Distributor of Unicity. This guarantee policy provides the entitlement to Retail Customer only, but not for the Distributor of Unicity. Apart from the aforementioned guarantee policy, there shall not be any other guarantee from Unicity anymore. Unicity has no liability to damage either directly or indirectly resulted from or damaged from contract default from the use or incorrect to use Unicity products in accordance with qualifications or instructions for product use, including the case that Unicity has been informed in advance by the Retail Customer of the Distributor of damages caused by the incorrect use of product or inability to use such products consistently with qualifications or instructions for product use completely. Should you have any inconvenience, please contact BA Service of Unicity at Telephone Number 0-2092-6777, Facsimile 0-2092-6701, or website www.unicity.com

Notifying Cancellation of Product Order

You may instruct to cancel the aforementioned product order without any liability if such cancellation is made within seven (7) days starting from the date of product receiving. If you have cancelled any product order and made a payment in according to the purchasing contract, you will receive the refund within fifteen (15) days starting from the date that the Distributor of Unicity has been informed of such cancelling order and it shall be deemed that any benefit which may be caused by the transaction of product selling is void. In this connection, in case of any cancellation notification, you have to prepare products delivered to you by the Distributor of Unicity under this product selling contract duly at your resident. If you have prepared such product but the Distributor of Unicity has not retrieved the product within twenty-one (21) days starting from the date that the Distributor of Unicity has received notification of cancellation, you may keep or discard such products without any liability. In this connection, if you do not prepare such product for the Distributor of Unicity, or if you agree to return such product to the Distributor of Unicity but do not comply with such intention, you shall be responsible for any liabilities under this contract.

Retail Customer Refund Policy

Unicity requires that Distributors provide Retail Customers a 100% money-back Guarantee in case that the retail customer cancelled product order within seven (7) days starting from the date of product receiving. In this connection, the Distributor of Unicity shall refund full amount of money paid by the Retail Customer for such product purchased to the Retail Customer within fifteen (15) days, starting from the date of receiving a notification of product order cancellation. Later on, Unicity shall change products or make a refund based on product value to the Distributor who refunded such money to Retail Customer in accordance with this policy. The Distributor shall request for refund made to Unicity within thirty (30) days starting from the date of product receiving mentioned in a receipt. Unicity shall deduct processing fee based on actual amount, as well as benefits received previously based on the Award Plan. If the Distributor fails to comply with the guarantee and refund policy of Unicity and such failure causes Unicity to refund money to the Retail Customer directly, the Distributor shall be responsible for the compensation made to Unicity at the full amount of money, together with processing fee accounting for ten percent (10%) of product return balance in accordance with the cost purchased by the Distributor. In this connection, the Distributor requesting for refund of product cost under this policy shall comply with the following provisions.

1)  Filling in the request form and submit to BA Service

2)  The Distributor returns products, attaching with receipt that the Distributor issued for Retail Customer, a notification with reason for product return from Retail Customer, original receipt for product purchased from Unicity showing items consistent with products to be returned (receipt shall not be over thirty (30) days starting from the date of product receiving mentioned in a receipt), and other relevant documents.

3)  Unicity shall consider and process the refund to the Distributor within thirty (30) days starting from the date of receiving the complete set of aforementioned documents.
""", style: TextTypes.headline6, color: AppColor.charcoal))
        ],
      ),
    );
  }
}
