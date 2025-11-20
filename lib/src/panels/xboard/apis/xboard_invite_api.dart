import '../../../core/http/http_service.dart';
import '../../../core/models/api_response.dart';
import '../../../core/exceptions/xboard_exceptions.dart';
import '../../../contracts/invite_api.dart';
import '../models/xboard_invite_models.dart';

/// XBoard 邀请 API 实现
class XBoardInviteApi implements InviteApi {
  final HttpService _httpService;

  XBoardInviteApi(this._httpService);

  @override
  Future<ApiResponse<InviteCode>> generateInviteCode() async {
    try {
      final response = await _httpService.getRequest('/api/v1/user/invite/save');
      return ApiResponse.fromJson(
        response,
        (json) => InviteCode.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      throw ApiException('Generate invite code failed: $e');
    }
  }

  @override
  Future<ApiResponse<InviteInfo>> getInviteInfo() async {
    try {
      final response = await _httpService.getRequest('/api/v1/user/invite/fetch');
      return ApiResponse.fromJson(
        response,
        (json) => InviteInfo.fromJson(json as Map<String, dynamic>),
      );
    } catch (e) {
      throw ApiException('Fetch invite codes failed: $e');
    }
  }

  @override
  Future<ApiResponse<List<CommissionDetail>>> fetchCommissionDetails({
    required int current,
    required int pageSize,
  }) async {
    try {
      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final uri = '/api/v1/user/invite/details?current=$current&page_size=$pageSize&t=$timestamp';
      final response = await _httpService.getRequest(uri);
      
      // API 返回: {data: [...], total: 10}
      final dynamic dataField = response['data'];
      
      List<CommissionDetail> details;
      if (dataField is List) {
        // 如果 data 直接是数组
        details = dataField
            .map((e) => CommissionDetail.fromJson(e as Map<String, dynamic>))
            .toList();
      } else if (dataField is Map<String, dynamic>) {
        // 如果 data 是嵌套结构
        final detailData = dataField['data'] as List<dynamic>? ?? [];
        details = detailData
            .map((e) => CommissionDetail.fromJson(e as Map<String, dynamic>))
            .toList();
      } else {
        details = [];
      }
      
      return ApiResponse(
        success: true,
        data: details,
        message: response['message'] as String?,
      );
    } catch (e) {
      if (e is XBoardException) rethrow;
      throw ApiException('Fetch commission details failed: $e');
    }
  }

  @override
  Future<String> generateInviteLink(String baseUrl) async {
    // 获取邀请信息以获取邀请码
    final inviteInfo = await getInviteInfo();
    final codes = inviteInfo.data?.codes ?? [];
    
    if (codes.isEmpty) {
      throw ApiException('No invite codes available');
    }
    
    // 使用第一个有效的邀请码
    final code = codes.firstWhere(
      (c) => c.isActive,
      orElse: () => codes.first,
    ).code;
    
    return '$baseUrl/?code=$code';
  }
}
