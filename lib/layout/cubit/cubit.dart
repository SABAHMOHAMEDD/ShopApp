import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopapp/layout/cubit/states.dart';
import 'package:shopapp/models/CategoriesModel.dart';
import 'package:shopapp/models/ChangeFavorites.dart';
import 'package:shopapp/models/FavoritesModel.dart';
import 'package:shopapp/models/HomeModel.dart';
import 'package:shopapp/models/Login_model.dart';
import 'package:shopapp/modules/products_screen.dart';
import 'package:shopapp/modules/profile_screen.dart';
import 'package:shopapp/shared/network/endPoint.dart';
import 'package:shopapp/shared/network/remote/dio_helper.dart';

import '../../modules/categories_screen.dart';
import '../../modules/favourites_screen.dart';
import '../../shared/components/constant.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopIntialState()); // need intial state in the super

  static ShopCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> bottomScreens = [
    ProductsScreen(),
    CategoriesScreen(),
    FavouritesScreen(),
    SettinsScreen()
  ];

  void Changebottom(int index) {
    currentIndex = index;
    emit(ShopChageBottomNavState());
  }

  HomeModel? homeModel;
  Map<num?, bool?> favourites = {};

  void getHomeData() {
    emit(ShopLoadingHomeDataState());

    DioHelper.getData(token: token, url: HOME).then((value) {
      homeModel = HomeModel.fromJson(value.data);
      homeModel?.data?.products?.forEach((element) {
        favourites.addAll({element.id: element.inFavorites});
      });
      print(favourites.toString());

      emit(ShopSuccessHomeDataState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorHomeDataState());
    });
  }

  CategoriesModel? categoriesModel;

  void getCategories() {
    DioHelper.getData(token: token, url: GET_CATEGORIES).then((value) {
      categoriesModel = CategoriesModel.fromJson(value.data);

      emit(ShopSuccessCategoriesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorCategoriesState());
    });
  }

  FavoritesModel? favoritesModel;

  void getFavorites() {
    emit(ShopLoadingGetFavoritesState());
    DioHelper.getData(token: token, url: FAVORITES).then((value) {
      favoritesModel = FavoritesModel.fromJson(value.data);

      emit(ShopSuccessGetFavoritesState());
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorGetFavoritesState());
    });
  }

  ChangeFavorites? changeFavorites;

  void changefavorites(num? productId) {
    favourites[productId] = !favourites[productId]!;
    emit(ShopChangeFavoritesState());

    DioHelper.PostData(
            url: FAVORITES, data: {'product_id': productId}, token: token)
        .then((value) {
      changeFavorites = ChangeFavorites.fromJson(value.data);
      if (!changeFavorites!.status!) {
        favourites[productId] = !favourites[productId]!;
      } else {
        getFavorites();
      }

      print(value.data);
      emit(ShopSuccessChangeFavoritesState(changeFavorites!));
    }).catchError((error) {
      emit(ShopErrorChangeFavoritesState());
    });
  }

  LoginModel? userModel;

  void getUserData() {
    emit(ShopLoadingUserDataState());

    DioHelper.getData(url: PROFILE, token: token).then((value) {
      userModel = LoginModel.fromJson(value.data);
      print(userModel?.data?.name);
      emit(ShopSuccessUserDataState(userModel));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUserDataState());
    });
  }

  void UpdateUserData({
    required String name,
    required String email,
    required String phone,
  }) {
    emit(ShopLoadingUpdateUserState());

    DioHelper.PUTData(url: UPDATE_PROFILE, token: token, data: {
      'name': name,
      'email': email,
      'phone': phone,
    }).then((value) {
      userModel = LoginModel.fromJson(value.data);
      print(userModel?.data?.name);
      emit(ShopSuccessUpdateUserState(userModel));
    }).catchError((error) {
      print(error.toString());
      emit(ShopErrorUpdateUserState());
    });
  }
}
