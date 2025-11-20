import '../../../core/http/http_service.dart';
import '../models/xboard_config_models.dart';
import '../../../core/exceptions/xboard_exceptions.dart';
import '../../../contracts/config_api.dart';

/// XBoard 配置 API 实现
class XBoardConfigApi implements ConfigApi {
  final HttpService _httpService;

  XBoardConfigApi(this._httpService);

  @override
  Future<ConfigData> getConfig() async {
    try {
      final result = await _httpService.getRequest('/api/v1/user/comm/config');
      return ConfigData.fromJson(result['data'] as Map<String, dynamic>);
    } catch (e) {
      if (e is XBoardException) rethrow;
      throw ApiException('获取配置失败: $e');
    }
  }
}
