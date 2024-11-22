import 'package:event_management/feature/homePage/controller/event_notifier_controller.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ticket_widget/ticket_widget.dart';

class TicketCardWidget extends HookConsumerWidget {
  const TicketCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: const BoxDecoration(),
      width: double.infinity,
      height: 180,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: ref.read(eventProvider).length,
          itemBuilder: (context, index) {
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
                                Text(ref.read(eventProvider)[index].name),
                                Text(ref.read(eventProvider)[index].location),
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
                                      Text(ref.read(eventProvider)[index].date),
                                      Text(ref.read(eventProvider)[index].time),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(children: [
                                    Text(ref
                                        .read(eventProvider)[index]
                                        .location),
                                  ]),
                                ),
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
