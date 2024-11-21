import 'package:event_management/feature/homePage/model/event_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final eventProvider =
    StateNotifierProvider<EventNotifier, List<EventModel>>(
  (ref) => EventNotifier(),
);

class EventNotifier extends StateNotifier<List<EventModel>> {
  EventNotifier()
      : super([
          EventModel.fromJson({
            'id': '123',
            'image': 'assets/images/user.jpg',
            'category': 'music',
            'name': 'Event 1',
            'date': '2023-06-01',
            'time': '10:00 AM',
            'description':
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            'price': '100',
            'location': 'Location 1',
            'attendees': '100',
          }),
          EventModel.fromJson({
            'id': '124',
            'image': 'assets/images/user.jpg',
            'category': 'music',
            'name': 'Event 2',
            'date': '2023-06-02',
            'time': '11:00 AM',
            'description':
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            'price': '100',
            'location': 'Location 2',
            'attendees': '100',
          }),
          EventModel.fromJson({
            'id': '125',
            'image': 'assets/images/user.jpg',
            'category': 'sports',
            'name': 'Event 3',
            'date': '2023-06-03',
            'time': '12:00 PM',
            'description':
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            'price': '100',
            'location': 'Location 3',
            'attendees': '100',
          }),
        ]);

}
