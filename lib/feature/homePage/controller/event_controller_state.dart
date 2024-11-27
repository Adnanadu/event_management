import 'package:event_management/feature/homePage/model/event_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'event_controller_state.g.dart';
part 'event_controller_state.freezed.dart';

@freezed
class EventControllerState with _$EventControllerState {
  factory EventControllerState({
    required List<EventModel> events,
    required List<String> favorites,
  }) = _EventControllerState;
}

@riverpod
class EventState extends _$EventState {
  @override
  EventControllerState build() {
    // Change return type to EventControllerState
    return EventControllerState(events: [
      const EventModel(
        id: "1",
        image: "assets/images/user.jpg",
        category: "Music",
        name: "Live Concert",
        date: "2023-03-19",
        time: "10:00 PM - 12:00 PM",
        description: "Join us for a night of live music and entertainment!",
        price: "100.00",
        location: "New York, NY",
        attendees: "50",
      ),
      const EventModel(
        id: "2",
        image: "assets/images/user.jpg",
        category: "Sports",
        name: "Live Concert",
        date: "2023-03-19",
        time: "10:00 PM - 11:00 PM",
        description: "Join us for a night of live music and entertainment!",
        price: "100.00",
        location: "New York, NY",
        attendees: "50",
      )
    ], favorites: [
      "1"
    ]);
  }

  void addEvent(EventModel event) {
    state = EventControllerState(
        events: [...state.events, event], favorites: [...state.favorites]);
  }

  void removeEvent(EventControllerState eventid) {
    state = EventControllerState(
        events: state.events.where((eventid) => eventid != eventid).toList(),
        favorites: state.favorites);
  }

  void addFavorite(String eventId) {
    // Change parameter type to String
    if (!state.favorites.contains(eventId)) {
      state = EventControllerState(
        events: state.events, // Keep the current events
        favorites: [...state.favorites, eventId], // Add the new favorite
      );
    }
  }

  void removeFavorite(String eventId) {
    // Change parameter type to String
    state = EventControllerState(
      events: state.events, // Keep the current events
      favorites: state.favorites
          .where((id) => id != eventId)
          .toList(), // Remove favorite by ID
    );
  }
}
