import 'package:bloc/bloc.dart';
import 'package:test_ecommerce/domain/usecase/product_repository.dart';
import 'package:test_ecommerce/presenter/states/state.dart';
import 'package:rxdart/rxdart.dart';

class SearchProductBloc extends Bloc<String, SearchState> {
  SearchProductBloc(this.usecase) : super(SearchStart());

  final GetProducts usecase;

  @override
  // ignore: avoid_renaming_method_parameters
  Stream<SearchState> mapEventToState(String nameProduct) async* {
    yield SearchLoading();
    final result = await usecase(nameProduct);
    yield result.fold((l) => SearchError(), (r) => SearchSuccess(r));
  }

  @override
  Stream<Transition<String, SearchState>> transformEvents(Stream<String> events,
      TransitionFunction<String, SearchState> transitionFn) {
    return super.transformEvents(
        events.debounceTime(const Duration(milliseconds: 1000)), transitionFn);
  }
}
