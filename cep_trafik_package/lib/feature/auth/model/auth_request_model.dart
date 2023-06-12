import 'package:cep_trafik_package/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_request_model.g.dart';

@JsonSerializable()
class AuthRequestModel extends BaseModel<AuthRequestModel> {
  @JsonKey(name: 'grant_type')
  final String? grantType;
  @JsonKey(name: 'username')
  final String? userName;
  final String? password;

  AuthRequestModel({
    this.grantType,
    this.userName,
    this.password,
  }
 
  );

  factory AuthRequestModel.fromJson(Map<String, dynamic> json) => _$AuthRequestModelFromJson(json);

  @override
  AuthRequestModel fromJson(Map<String, dynamic> json) {
    return _$AuthRequestModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$AuthRequestModelToJson(this);
  }
}
