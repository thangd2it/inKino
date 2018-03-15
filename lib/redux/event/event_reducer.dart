import 'package:inkino/data/event.dart';
import 'package:inkino/redux/actions.dart';
import 'package:inkino/redux/event/event_state.dart';
import 'package:inkino/redux/loading_status.dart';
import 'package:redux/redux.dart';

final eventReducer = combineTypedReducers([
  new ReducerBinding<EventState, RequestingEventsAction>(_requestingEvents),
  new ReducerBinding<EventState, ReceivedEventsAction>(_receivedEvents),
]);

EventState _requestingEvents(EventState state, RequestingEventsAction action) {
  return state.copyWith(loadingStatus: LoadingStatus.loading);
}

EventState _receivedEvents(EventState state, ReceivedEventsAction action) {
  return state.copyWith(
    loadingStatus: LoadingStatus.success,
    nowInTheatersEvents: action.nowInTheatersEvents,
    comingSoonEvents: action.comingSoonEvents,
  );
}