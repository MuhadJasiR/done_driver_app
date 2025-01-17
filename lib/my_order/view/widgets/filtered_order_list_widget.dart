import 'dart:developer';

import 'package:done_driver_app/constraints/const_colors.dart';
import 'package:done_driver_app/constraints/constraints.dart';
import 'package:done_driver_app/my_order/controller/order_controller.dart';
import 'package:done_driver_app/my_order/view/order_track_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterOrderListTile extends StatelessWidget {
  const FilterOrderListTile({
    super.key,
    required this.orderController,
  });

  final OrderController orderController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight(10),
        const Text(
          "Current Shipment",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        kHeight(10),
        Text(orderController.filteredOrderDetails.isEmpty
            ? "There is no order today"
            : "Today Orders ${orderController.filteredOrderDetails.length}"),
        kHeight(10),
        Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  final filteredOrderDetails =
                      orderController.filteredOrderDetails[index];
                  return orderController.filteredOrderDetails.isEmpty
                      ? const Center(
                          child: Column(
                            children: [
                              Icon(
                                Icons.notification_important_outlined,
                                color: Colors.black,
                              ),
                              Text("There is no Order Today")
                            ],
                          ),
                        )
                      : Card(
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      NetworkImage(filteredOrderDetails.image),
                                ),
                                kWidth(10),
                                Flexible(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        filteredOrderDetails.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                      kHeight(5),
                                      Text(
                                        "Street: ${filteredOrderDetails.street} Jedha: ${filteredOrderDetails.jedha} House Number: ${filteredOrderDetails.houseNumber} Floor Number: ${filteredOrderDetails.floorNumber}",
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 4,
                                        style:
                                            const TextStyle(color: kGreyColor),
                                      ),
                                      kHeight(10),
                                      InkWell(
                                        onTap: () {
                                          orderController.orderId =
                                              filteredOrderDetails.id.obs;
                                          log(
                                              orderController.orderId
                                                  .toString(),
                                              name: "Order Id");
                                          Get.to(const TrackDetailsScreen());
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 30, vertical: 5),
                                          decoration: BoxDecoration(
                                              color: kPrimaryColor,
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: const Text(
                                            "Track",
                                            style:
                                                TextStyle(color: kWhiteColor),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                },
                separatorBuilder: (context, index) => kHeight(10),
                itemCount: orderController.filteredOrderDetails.length))
      ],
    );
  }
}
