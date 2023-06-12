import 'package:bloc/bloc.dart';
import 'package:cep_trafik_package/core/base/cubit/base_cubit.dart';
import 'package:cep_trafik_package/feature/auth/model/auth_response_model.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> with BaseCubit{
  AuthCubit() : super(AuthInitial());

  @override
  void init() {
    // TODO: implement init
  }

  @override
  void setContext(BuildContext context) {
    // TODO: implement setContext
  }
}
