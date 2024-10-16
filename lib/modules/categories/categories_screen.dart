import 'package:click_n_shop/layout/cubit/_cubit.dart';
import 'package:click_n_shop/layout/cubit/_state.dart';
import 'package:click_n_shop/models/categories_model.dart';
import 'package:click_n_shop/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ShopCubit.get(context).homeModel == null ||
                ShopCubit.get(context).categoriesModel == null
            ? const Center(child: CircularProgressIndicator())
            : ListView.separated(
                itemBuilder: (context,index) => buildCartItem(
                    ShopCubit.get(context).categoriesModel!.data!.data![index]),
                separatorBuilder: (context, index) => myDivider(),
                itemCount:
                    ShopCubit.get(context).categoriesModel!.data!.data!.length,
              );
      },
    );
  }

  Widget buildCartItem(DataModel model) => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Image(
              image: NetworkImage(model.image!),
              width: 80,
              height: 80,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              model.name!,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios),
          ],
        ),
      );
}
