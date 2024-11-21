import 'package:flutter/material.dart';
import 'package:ticket_widget/ticket_widget.dart';

class TicketCardWidget extends StatelessWidget {
  const TicketCardWidget({
    super.key,
    required this.festivalId,
  });

  final ValueNotifier<Map<String, Map<String, String>>> festivalId;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      width: double.infinity,
      height: 180,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: festivalId.value.length,
          itemBuilder: (context, index) {
            final festival = festivalId.value.values.elementAt(index);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: TicketWidget(
                  width: 0,
                  height: 0,
                  isCornerRounded: true,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                                height: 40, width: 40, child: Placeholder()),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /// Festival name display here
                                Text(festival['name'] ?? ""),
                                Text(festival['location'] ?? ""),
                              ],
                            ),
                          ],
                        ),
                      ),

                      /// ticket line path of middle
                      Container(
                        height: 1,
                        color: Colors.transparent,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: List.generate(
                            15,
                            (index) => Container(
                              width: 10, // Width of each dash
                              height: 1,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(festival['date'] ?? ""),
                                      Text(festival['time'] ?? ""),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(children: [
                                    Text(festival['location'] ?? ""),
                                    Text(festival['location'] ?? ""),
                                  ]),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 2),
                                    decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    // height: 10,
                                    child: const Text("Premium Ticket x1"),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
