import 'package:click_n_shop/layout/cubit/_cubit.dart';
import 'package:click_n_shop/layout/cubit/_state.dart';
import 'package:click_n_shop/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var searchController = TextEditingController();
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {
        if(state is ShopSuccessGetFavoritesState) {
          ShopCubit.get(context).search(searchController.text);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  defaultFormField(
                    controller: searchController,
                    type: TextInputType.text,
                    validate: (String? value){
                      if(value!.isEmpty){
                        return 'enter text to search';
                      }
                    },
                    label: 'Search',
                    prefix: Icons.search,
                    onSubmit: (String text){
                      ShopCubit.get(context).search(text);
                    }
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  if(state is SearchLoadingState)
                  const LinearProgressIndicator(),
                  const SizedBox(
                    height: 10,
                  ),
                  if(state is SearchSuccessState)
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (context, index) => buildListProduct(
                          ShopCubit.get(context).model!.data!.data![index],
                          context,
                      ),
                      separatorBuilder: (context, index) => myDivider(),
                      itemCount:
                      ShopCubit.get(context).model!.data!.data!.length,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
