import 'package:cep_trafik_package/core/base/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auth_response_model.g.dart';

@JsonSerializable()
class AuthResponseModel extends BaseModel<AuthResponseModel>{
@JsonKey(name: 'access_token')
final String? accessToken;
@JsonKey(name: 'token_type')
final String? tokenType;
@JsonKey(name: 'expires_in')
final int? expiresIn;

  AuthResponseModel({this.accessToken, this.tokenType, this.expiresIn});

//factory AuthResponseModel.fromJson(Map<String, dynamic> json) => _$AuthResponseModelFromJson(json);

@override
AuthResponseModel fromJson(Map<String, dynamic> json) {
return _$AuthResponseModelFromJson(json);
}

@override
Map<String, dynamic> toJson() {
return _$AuthResponseModelToJson(this);
}
}