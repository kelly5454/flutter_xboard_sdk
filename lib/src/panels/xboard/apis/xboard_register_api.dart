import '../../../core/http/http_service.dart';
import '../../../core/models/api_response.dart';
import '../../../core/exceptions/xboard_exceptions.dart';
import '../../../contracts/register_api.dart';

/// XBoard 注册 API 实现
class XBoardRegisterApi implements RegisterApi {
  final HttpService _httpService;

  XBoardRegisterApi(this._httpService);

  @override
  Future<ApiResponse> register(
    String email,
    String password,
    String? inviteCode,
    String? emailCode,
  ) async {
    try {
      // XBoard: 所有字段都是必填的，空值传空字符串
      final response = await _httpService.postRequest(
        "/api/v1/passport/auth/register",
        {
          "email": email,
          "password": password,
          "invite_code": inviteCode ?? '',
          "email_code": emailCode ?? '',
        },
      );
      return ApiResponse.fromJson(response, (json) => json);
    } catch (e) {
      if (e is XBoardException) rethrow;
      throw ApiException('Register failed: $e');
    }
  }
}
