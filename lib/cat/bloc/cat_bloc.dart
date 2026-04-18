// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../api_service.dart';
// import 'cat_event.dart';
// import 'cat_state.dart';

// class CatBloc extends Bloc<CatEvent, CatState> {
//   final ApiService apiService;

//   CatBloc(this.apiService) : super(CatInitialState()) {
//     on<LoadCatEvent>((event, emit) async {
//       emit(CatLoadingState()); // 1. Сразу показываем загрузку

//       try {
//         // 2. Ждем данные от сервиса
//         final String imageUrl = await apiService.getCatImage();
//         // 3. Если успех — показываем картинку
//         emit(CatLoadedState(imageUrl));
//       } catch (e) {
//         // 4. Если ошибка — показываем ошибку
//         emit(CatErrorState("Не удалось загрузить котика")); // Ошибка}
//       }
//     });
//   }
// }
