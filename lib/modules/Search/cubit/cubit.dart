import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/models/SearchModel.dart';
import 'package:shopapp/modules/Search/cubit/states.dart';
import 'package:shopapp/shared/components/constant.dart';
import 'package:shopapp/shared/network/endPoint.dart';
import 'package:shopapp/shared/network/remote/dio_helper.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? model;

  void Search(String text) {
    emit(SearchLoadingState());
    DioHelper.PostData(url: SEARCH, token: token, data: {'text': text})
        .then((value) {
      model = SearchModel.fromJson(value.data);
      emit(SearchSuccessState());
    }).catchError((error) {
      print(error.toString());

      emit(SearchErrorState());
    });
  }
}
