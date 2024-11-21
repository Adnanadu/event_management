import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExploreEventWidget extends StatelessWidget {
  const ExploreEventWidget({
    super.key,
    required this.festivalId,
    required this.isFavourite,
  });

  final ValueNotifier<Map<String, Map<String, String>>> festivalId;
  final ValueNotifier<bool> isFavourite;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: festivalId.value.length,
      itemBuilder: (context, index) {
        final festival = festivalId.value.values.elementAt(index); //
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              GestureDetector(
                onTap: () {
                  /// navigate to festival detail page
                  context.push('/festival');
                },
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25)),
                    image: DecorationImage(
                        image: AssetImage("assets/images/user.jpg"),
                        fit: BoxFit.cover),
                  ),
                  height: 200,
                  width: double.infinity,
                ),
              ),
              Positioned(
                  top: 10,
                  right: 10,
                  child: IconButton(
                      onPressed: () {
                        /// add and remove from favourite and when click on favourite icon change color
                        isFavourite.value = !isFavourite.value;
                        if (isFavourite.value) {
                          /// add to favourite
                        } else {
                          /// remove from favourite
                        }
                      },
                      icon: Icon(isFavourite.value
                          ? Icons.favorite
                          : Icons.favorite_border_outlined))),
              Positioned(
                  bottom: 10,
                  left: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: const BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.all(Radius.circular(25)),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(festival['name'] ?? ""),
                        Text(festival['location'] ?? ""),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            /// display date and time from festivalId
                            Text(festival['date'] ?? ""),
                            Text(festival['time'] ?? ""),
                          ],
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }
}
