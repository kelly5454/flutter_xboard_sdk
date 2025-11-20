import '../http/http_service.dart';
import '../../contracts/contracts.dart';
import '../../panels/xboard/xboard_export.dart';
import 'panel_type.dart';

/// API 工厂
/// 根据面板类型创建对应的 API 实现
class ApiFactory {
  final PanelType _panelType;
  final HttpService _httpService;

  ApiFactory(this._panelType, this._httpService);

  /// 创建邀请 API
  InviteApi createInviteApi() {
    switch (_panelType) {
      case PanelType.xboard:
        return XBoardInviteApi(_httpService);
      case PanelType.v2board:
        throw UnimplementedError('V2Board InviteApi not implemented yet');
    }
  }

  /// 创建注册 API
  RegisterApi createRegisterApi() {
    switch (_panelType) {
      case PanelType.xboard:
        return XBoardRegisterApi(_httpService);
      case PanelType.v2board:
        throw UnimplementedError('V2Board RegisterApi not implemented yet');
    }
  }

  /// 创建用户信息 API
  UserInfoApi createUserInfoApi() {
    switch (_panelType) {
      case PanelType.xboard:
        return XBoardUserInfoApi(_httpService);
      case PanelType.v2board:
        throw UnimplementedError('V2Board UserInfoApi not implemented yet');
    }
  }

  /// 创建订单 API
  OrderApi createOrderApi() {
    switch (_panelType) {
      case PanelType.xboard:
        return XBoardOrderApi(_httpService);
      case PanelType.v2board:
        throw UnimplementedError('V2Board OrderApi not implemented yet');
    }
  }

  /// 创建套餐 API
  PlanApi createPlanApi() {
    switch (_panelType) {
      case PanelType.xboard:
        return XBoardPlanApi(_httpService);
      case PanelType.v2board:
        throw UnimplementedError('V2Board PlanApi not implemented yet');
    }
  }

  /// 创建余额 API
  BalanceApi createBalanceApi() {
    switch (_panelType) {
      case PanelType.xboard:
        return XBoardBalanceApi(_httpService);
      case PanelType.v2board:
        throw UnimplementedError('V2Board BalanceApi not implemented yet');
    }
  }

  /// 创建配置 API
  ConfigApi createConfigApi() {
    switch (_panelType) {
      case PanelType.xboard:
        return XBoardConfigApi(_httpService);
      case PanelType.v2board:
        throw UnimplementedError('V2Board ConfigApi not implemented yet');
    }
  }

  /// 创建登录 API
  LoginApi createLoginApi() {
    switch (_panelType) {
      case PanelType.xboard:
        return XBoardLoginApi(_httpService);
      case PanelType.v2board:
        throw UnimplementedError('V2Board LoginApi not implemented yet');
    }
  }

  /// 创建工单 API
  TicketApi createTicketApi() {
    switch (_panelType) {
      case PanelType.xboard:
        return XBoardTicketApi(_httpService);
      case PanelType.v2board:
        throw UnimplementedError('V2Board TicketApi not implemented yet');
    }
  }

  /// 创建订阅 API
  SubscriptionApi createSubscriptionApi() {
    switch (_panelType) {
      case PanelType.xboard:
        return XBoardSubscriptionApi(_httpService);
      case PanelType.v2board:
        throw UnimplementedError('V2Board SubscriptionApi not implemented yet');
    }
  }

  /// 创建公告 API
  NoticeApi createNoticeApi() {
    switch (_panelType) {
      case PanelType.xboard:
        return XBoardNoticeApi(_httpService);
      case PanelType.v2board:
        throw UnimplementedError('V2Board NoticeApi not implemented yet');
    }
  }

  /// 创建优惠券 API
  CouponApi createCouponApi() {
    switch (_panelType) {
      case PanelType.xboard:
        return XBoardCouponApi(_httpService);
      case PanelType.v2board:
        throw UnimplementedError('V2Board CouponApi not implemented yet');
    }
  }

  /// 创建 APP API
  AppApi createAppApi() {
    switch (_panelType) {
      case PanelType.xboard:
        return XBoardAppApi(_httpService);
      case PanelType.v2board:
        throw UnimplementedError('V2Board AppApi not implemented yet');
    }
  }

  /// 创建支付 API
  PaymentApi createPaymentApi() {
    switch (_panelType) {
      case PanelType.xboard:
        return XBoardPaymentApi(_httpService);
      case PanelType.v2board:
        throw UnimplementedError('V2Board PaymentApi not implemented yet');
    }
  }

  /// 创建邮箱验证码 API
  SendEmailCodeApi createSendEmailCodeApi() {
    switch (_panelType) {
      case PanelType.xboard:
        return XBoardSendEmailCodeApi(_httpService);
      case PanelType.v2board:
        throw UnimplementedError('V2Board SendEmailCodeApi not implemented yet');
    }
  }

  /// 创建重置密码 API
  ResetPasswordApi createResetPasswordApi() {
    switch (_panelType) {
      case PanelType.xboard:
        return XBoardResetPasswordApi(_httpService);
      case PanelType.v2board:
        throw UnimplementedError('V2Board ResetPasswordApi not implemented yet');
    }
  }
}
