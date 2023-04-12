import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mubaha/data/model/address/address_model.dart';
import 'package:mubaha/data/repository/customer/customer_repository.dart';
import 'package:mubaha/injection.dart';
import 'package:mubaha/ui/router/router.gr.dart';
import 'package:mubaha/ui/screen/main/address/cubit/address/address_cubit.dart';
import 'package:mubaha/ui/screen/main/address/cubit/address/address_state.dart';
import 'package:mubaha/ui/screen/main/address/ui/widget/address_widget.dart';
import 'package:mubaha/ui/shared/loading_screen.dart';
import 'package:mubaha/ui/shared/widget/button/primary_button.dart';
import 'package:mubaha/ui/shared/widget/header/header.dart';
import 'package:mubaha/ui/theme/constant.dart';

class AddressScreen extends StatelessWidget {
  final AddressDataResponse? addressData;
  final Function(AddressDataResponse addressData)? onBack;
  const AddressScreen({Key? key, this.addressData, this.onBack})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            AddressCubit(getIt.get<CustomerRepository>())..getAddress(),
        child: BlocConsumer<AddressCubit, AddressState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state.isLoading) return const LoadingScreen();

            return SafeArea(
              child: Column(
                children: [
                  const Header(
                    title: 'Địa chỉ',
                    isBack: true,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: kDefaultPaddingWidthWidget),
                              child: ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: state.addressData!.length,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      onBack!.call(state.addressData![index]);
                                      context.router.pop();
                                    },
                                    child: AddressWidget(
                                      isSelect: addressData!.id ==
                                          state.addressData![index].id,
                                      addressData: state.addressData![index],
                                    ),
                                  );
                                },
                              )),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: kDefaultPaddingWidthWidget),
                            child: PrimaryButton.outlineColor(
                              label: 'Thêm địa chỉ',
                              onPressed: () =>
                                  context.router.push(NewAddressPage(
                                onBack: (AddressDataResponse addressData,
                                    bool isUpdate) async {
                                  isUpdate
                                      ? await context
                                          .read<AddressCubit>()
                                          .updateListAddressWhenUpdate(
                                              addressData: addressData)
                                      : await context
                                          .read<AddressCubit>()
                                          .updateListAddressWhenAddNew(
                                              addressData: addressData);
                                },
                              )),
                            ),
                          ),
                          SizedBox(
                            height: kDefaultPaddingWidth,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
