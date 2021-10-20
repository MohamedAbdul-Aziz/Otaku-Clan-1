import 'package:flutter_request_bloc/cubits/request_cubit.dart';
import 'package:flutter_request_bloc/cubits/request_state.dart';
import 'package:myanime/models/category.dart';
import 'package:myanime/models/manga.dart';
import 'package:myanime/repositories/managa.dart';
import 'package:myanime/repositories/movies.dart';

/// Cubit that holds information about Top Anime.
class Mangacubit extends RequestCubit<MangaRepository, Manga> {
  Mangacubit(MangaRepository repository) : super(repository);

  @override
  Future<List> loadData({int numTopCubit = 1}) async {
    if (numTopCubit == 1) {
      emit(RequestState.loading(state.value));
    }

    try {
      final data = await repository.fetchData(numService: numTopCubit);
      emit(RequestState.loading(state.value));

      emit(RequestState.loaded(data));
      return data.top;
    } catch (e) {
      emit(RequestState.error(e.toString()));
      return null;
    }
  }
}

// import 'package:flutter_request_bloc/cubits/request_cubit.dart';
// import 'package:flutter_request_bloc/cubits/request_state.dart';
// import 'package:myanime/models/category.dart';
// import 'package:myanime/models/manga.dart';
// import 'package:myanime/repositories/managa.dart';
// import 'package:myanime/repositories/movies.dart';

// /// Cubit that holds information about Top Anime.
// class Mangacubit extends RequestCubit<MangaRepository, Manga> {
//   Mangacubit(MangaRepository repository) : super(repository);

//   @override
//   Future<List> loadData({int numTopCubit = 1}) async {
//     emit(RequestState.loading(state.value));

//     try {
//       final data = await repository.fetchData(numService: numTopCubit);

//       emit(RequestState.loaded(data));
//     } catch (e) {
//       emit(RequestState.error(e.toString()));
//     }
//   }
// }
