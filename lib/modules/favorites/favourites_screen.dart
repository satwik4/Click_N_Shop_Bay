import 'package:click_n_shop/layout/cubit/_cubit.dart';
import 'package:click_n_shop/layout/cubit/_state.dart';
import 'package:click_n_shop/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ShopCubit.get(context).homeModel == null ||
                ShopCubit.get(context).categoriesModel == null ||
                ShopCubit.get(context).favoritesModel == null ||
                state is ShopLoadingGetFavoritesState
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                itemBuilder: (context, index) => buildListProduct(
                    ShopCubit.get(context).favoritesModel!.data!.data![index].product,
                    context),
                separatorBuilder: (context, index) => myDivider(),
                itemCount:
                    ShopCubit.get(context).favoritesModel!.data!.data!.length,
              );
      },
    );
  }

}
