// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:techqrmaintance/application/after_accept_reject_bloc/afte_accept_reject_bloc.dart'
    as _i41;
import 'package:techqrmaintance/application/area_bloc/area_bloc.dart' as _i175;
import 'package:techqrmaintance/application/authbloc/authbloc_bloc.dart'
    as _i600;
import 'package:techqrmaintance/application/brandnadmodel/brand_and_model_bloc.dart'
    as _i606;
import 'package:techqrmaintance/application/catagorybloc/catogory_bloc.dart'
    as _i737;
import 'package:techqrmaintance/application/checkbloc/checkbloc_bloc.dart'
    as _i794;
import 'package:techqrmaintance/application/custbloc/customer_bloc.dart'
    as _i134;
import 'package:techqrmaintance/application/deviceregbloc/deviceregbloc_bloc.dart'
    as _i91;
import 'package:techqrmaintance/application/docuploadbloc/doc_upload_bloc.dart'
    as _i1062;
import 'package:techqrmaintance/application/getidregbloc/getidregbloc_bloc.dart'
    as _i32;
import 'package:techqrmaintance/application/GetLocation/get_location_bloc.dart'
    as _i306;
import 'package:techqrmaintance/application/inventry_bloc/inventry_bloc.dart'
    as _i585;
import 'package:techqrmaintance/application/logbloc/logbloc_bloc.dart' as _i651;
import 'package:techqrmaintance/application/modelandbrand/model_and_brand_bloc.dart'
    as _i561;
import 'package:techqrmaintance/application/notify_setting_bloc/notify_setting_bloc.dart'
    as _i828;
import 'package:techqrmaintance/application/orgganizationbloc/oranization_bloc.dart'
    as _i818;
import 'package:techqrmaintance/application/pdf_upload_bloc/pdf_upload_bloc.dart'
    as _i437;
import 'package:techqrmaintance/application/requestscanqrbloc/request_scan_qr_endpoind_bloc.dart'
    as _i143;
import 'package:techqrmaintance/application/servicereqbyidbloc/service_req_by_id_bloc.dart'
    as _i1045;
import 'package:techqrmaintance/application/servicesrequest/service_request_bloc.dart'
    as _i600;
import 'package:techqrmaintance/application/single_user_bloc/single_user_bloc.dart'
    as _i848;
import 'package:techqrmaintance/application/spbloc/spbloc_bloc.dart' as _i15;
import 'package:techqrmaintance/application/techlistbloc/tech_list_bloc.dart'
    as _i300;
import 'package:techqrmaintance/application/techperfomancebloc/tech_perfomence_bloc.dart'
    as _i299;
import 'package:techqrmaintance/application/update_user_bloc/update_user_bloc.dart'
    as _i208;
import 'package:techqrmaintance/application/updateservicebloc/update_service_req_bloc.dart'
    as _i188;
import 'package:techqrmaintance/domain/afteracceptmodel/after_accept_reject_repo.dart'
    as _i40;
import 'package:techqrmaintance/domain/araemodel/get_area_repo.dart' as _i431;
import 'package:techqrmaintance/domain/authregmodel/auth_repo.dart' as _i291;
import 'package:techqrmaintance/domain/catagorymodel/catagory_get_repo.dart'
    as _i185;
import 'package:techqrmaintance/domain/core/docuploadrepo/docapload_repo.dart'
    as _i987;
import 'package:techqrmaintance/domain/core/getidfordevicereg/get_id_for_device_reg.dart'
    as _i1051;
import 'package:techqrmaintance/domain/core/getlocation/get_loc_repo.dart'
    as _i399;
import 'package:techqrmaintance/domain/core/requestqrrepo/req_scan_qr_repo.dart'
    as _i279;
import 'package:techqrmaintance/domain/core/splashcheck/splash_check.dart'
    as _i829;
import 'package:techqrmaintance/domain/core/spstoreduser/sp_stored_repo.dart'
    as _i158;
import 'package:techqrmaintance/domain/customer_model/customer_repo.dart'
    as _i509;
import 'package:techqrmaintance/domain/deviceregmodel/device_reg_repo.dart'
    as _i489;
import 'package:techqrmaintance/domain/docuploadmodel/upload_pdf_repo.dart'
    as _i641;
import 'package:techqrmaintance/domain/inventrymodel/inventry_repo.dart'
    as _i896;
import 'package:techqrmaintance/domain/modelandbrandmodel/brand_repo.dart'
    as _i1043;
import 'package:techqrmaintance/domain/modelandbrandmodel/device_model_model_repo.dart'
    as _i936;
import 'package:techqrmaintance/domain/organizationmodel/organization_repo.dart'
    as _i253;
import 'package:techqrmaintance/domain/servicerequestmodel/service_update_repo.dart'
    as _i553;
import 'package:techqrmaintance/domain/servicerequestmodel/servicerequest_repo.dart'
    as _i1064;
import 'package:techqrmaintance/domain/servicerequestmodel/services_req_call_by_id.dart'
    as _i231;
import 'package:techqrmaintance/domain/settingnotify/get_setting_notify_repo.dart'
    as _i1001;
import 'package:techqrmaintance/domain/techperfomencemodel/tech_perfomence_repo.dart'
    as _i5;
import 'package:techqrmaintance/domain/token/get_user_token_repo.dart' as _i748;
import 'package:techqrmaintance/domain/usermodel/single_user_repo.dart'
    as _i911;
import 'package:techqrmaintance/domain/usermodel/technitian_list_repo.dart'
    as _i740;
import 'package:techqrmaintance/domain/usermodel/update_user_repo.dart' as _i87;
import 'package:techqrmaintance/domain/usermodel/user_log_repo.dart' as _i765;
import 'package:techqrmaintance/infrastructure/afterserviceacceptandrejectservices/after_service_accept_reject.dart'
    as _i388;
import 'package:techqrmaintance/infrastructure/areaservices/area_services.dart'
    as _i154;
import 'package:techqrmaintance/infrastructure/authservices/auth_services.dart'
    as _i447;
import 'package:techqrmaintance/infrastructure/brandandmodelservices/brand_services.dart'
    as _i332;
import 'package:techqrmaintance/infrastructure/brandandmodelservices/model_services.dart'
    as _i1069;
import 'package:techqrmaintance/infrastructure/catagorygetservices/catagory_get_services.dart'
    as _i1055;
import 'package:techqrmaintance/infrastructure/checkloginservices/check_login_service.dart'
    as _i757;
import 'package:techqrmaintance/infrastructure/custservices/cust_services.dart'
    as _i338;
import 'package:techqrmaintance/infrastructure/deviceregservices/device_reg_seervices.dart'
    as _i1016;
import 'package:techqrmaintance/infrastructure/getiddeviceregservices/get_id_for_device_reg_services.dart'
    as _i670;
import 'package:techqrmaintance/infrastructure/getlocationservices/get_loc_services.dart'
    as _i42;
import 'package:techqrmaintance/infrastructure/gettokenservice/get_token_services.dart'
    as _i769;
import 'package:techqrmaintance/infrastructure/inventry_services/inventries_services.dart'
    as _i960;
import 'package:techqrmaintance/infrastructure/orgservices/org_services.dart'
    as _i844;
import 'package:techqrmaintance/infrastructure/pdf_uplaoad_services.dart/pdf_services.dart'
    as _i124;
import 'package:techqrmaintance/infrastructure/requestqrendpointservices/req_qr_endpoint_services.dart'
    as _i834;
import 'package:techqrmaintance/infrastructure/servicesrequestservices/service_req_by_id_services.dart'
    as _i681;
import 'package:techqrmaintance/infrastructure/servicesrequestservices/services_request_services.dart'
    as _i1025;
import 'package:techqrmaintance/infrastructure/servicesrequestservices/update_service_service.dart'
    as _i733;
import 'package:techqrmaintance/infrastructure/setting_notify_service/setings_notify_services.dart'
    as _i1019;
import 'package:techqrmaintance/infrastructure/single_user_services/single_user_services.dart'
    as _i597;
import 'package:techqrmaintance/infrastructure/spstroeditemservices/sp_stored_item_services.dart'
    as _i1027;
import 'package:techqrmaintance/infrastructure/technitian_dropdown_services/tecnitiandropdownservices.dart'
    as _i775;
import 'package:techqrmaintance/infrastructure/techperfomenceservices.dart/tech_perfomence_services.dart'
    as _i986;
import 'package:techqrmaintance/infrastructure/update_user_service/user_update_services.dart'
    as _i511;
import 'package:techqrmaintance/infrastructure/uploadfileservices/upload_file_services.dart'
    as _i882;
import 'package:techqrmaintance/infrastructure/userlogservices/user_log_services.dart'
    as _i819;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i40.AfterAcceptRejectRepo>(
        () => _i388.AfterServiceAcceptReject());
    gh.lazySingleton<_i185.CatagoryGetRepo>(() => _i1055.CatagoryServices());
    gh.lazySingleton<_i253.OrganizationRepo>(() => _i844.OrgServices());
    gh.lazySingleton<_i829.SplashCheckRepo>(() => _i757.CheckLoginServices());
    gh.lazySingleton<_i399.GetLocationRepo>(() => _i42.GetLocationServices());
    gh.lazySingleton<_i279.ReqScanQrRepo>(() => _i834.ReqQrEndpointServices());
    gh.lazySingleton<_i509.CustomerRepo>(() => _i338.CustomerServices());
    gh.factory<_i41.AfteAcceptRejectBloc>(
        () => _i41.AfteAcceptRejectBloc(gh<_i40.AfterAcceptRejectRepo>()));
    gh.lazySingleton<_i1064.ServicesRequestRepo>(
        () => _i1025.ServicesRequestServices());
    gh.lazySingleton<_i158.SpStoredUser>(() => _i1027.SpStoredItem());
    gh.lazySingleton<_i896.InventryRepo>(() => _i960.InventriesServices());
    gh.lazySingleton<_i1051.GetIdForDeviceRegRepo>(
        () => _i670.GetIdForDeviceRegServices());
    gh.factory<_i600.ServiceRequestBloc>(
        () => _i600.ServiceRequestBloc(gh<_i1064.ServicesRequestRepo>()));
    gh.lazySingleton<_i5.TechPerfomenceRepo>(
        () => _i986.TechPerfomenceServices());
    gh.lazySingleton<_i87.UpdateUserRepo>(() => _i511.UserUpdateServices());
    gh.lazySingleton<_i740.TechnitianListRepo>(
        () => _i775.Tecnitiandropdownservices());
    gh.lazySingleton<_i765.UserLogRepo>(() => _i819.UserLogServices());
    gh.factory<_i143.RequestScanQrEndpoindBloc>(
        () => _i143.RequestScanQrEndpoindBloc(gh<_i279.ReqScanQrRepo>()));
    gh.lazySingleton<_i553.ServiceUpdateRepo>(
        () => _i733.UpdateServiceService());
    gh.lazySingleton<_i748.GetTokenRepo>(() => _i769.GetTokenServices());
    gh.lazySingleton<_i641.UploadPdfRepo>(() => _i124.PdfServices());
    gh.lazySingleton<_i1001.GetSettingNotifyRepo>(
        () => _i1019.SetingsNotifyServices());
    gh.lazySingleton<_i489.DeviceRegRepo>(() => _i1016.DeviceRegService());
    gh.lazySingleton<_i987.DocaploadRepo>(() => _i882.UploadFileServices());
    gh.lazySingleton<_i911.SingleUserRepo>(() => _i597.SingleUserServices());
    gh.lazySingleton<_i291.AuthRepoReg>(() => _i447.AuthServices());
    gh.lazySingleton<_i1043.DeiceBrandRepo>(() => _i332.BrandServices());
    gh.lazySingleton<_i431.GetAreaRepo>(() => _i154.AreaServices());
    gh.lazySingleton<_i231.ServicesReqCallByIdRepo>(
        () => _i681.ServiceReqByIdServices());
    gh.lazySingleton<_i936.DeviceModelRepo>(() => _i1069.ModelServices());
    gh.factory<_i737.CatogoryBloc>(
        () => _i737.CatogoryBloc(gh<_i185.CatagoryGetRepo>()));
    gh.factory<_i208.UpdateUserBloc>(
        () => _i208.UpdateUserBloc(gh<_i87.UpdateUserRepo>()));
    gh.factory<_i606.BrandAndModelBloc>(
        () => _i606.BrandAndModelBloc(gh<_i1043.DeiceBrandRepo>()));
    gh.factory<_i306.GetLocationBloc>(
        () => _i306.GetLocationBloc(gh<_i399.GetLocationRepo>()));
    gh.factory<_i651.LogblocBloc>(
        () => _i651.LogblocBloc(gh<_i765.UserLogRepo>()));
    gh.factory<_i437.PdfUploadBloc>(
        () => _i437.PdfUploadBloc(gh<_i641.UploadPdfRepo>()));
    gh.factory<_i585.InventryBloc>(
        () => _i585.InventryBloc(gh<_i896.InventryRepo>()));
    gh.factory<_i561.ModelAndBrandBloc>(
        () => _i561.ModelAndBrandBloc(gh<_i936.DeviceModelRepo>()));
    gh.factory<_i818.OranizationBloc>(
        () => _i818.OranizationBloc(gh<_i253.OrganizationRepo>()));
    gh.factory<_i1062.DocUploadBloc>(
        () => _i1062.DocUploadBloc(gh<_i987.DocaploadRepo>()));
    gh.factory<_i15.SpblocBloc>(
        () => _i15.SpblocBloc(gh<_i158.SpStoredUser>()));
    gh.factory<_i848.SingleUserBloc>(
        () => _i848.SingleUserBloc(gh<_i911.SingleUserRepo>()));
    gh.factory<_i794.CheckblocBloc>(
        () => _i794.CheckblocBloc(gh<_i829.SplashCheckRepo>()));
    gh.factory<_i188.UpdateServiceReqBloc>(
        () => _i188.UpdateServiceReqBloc(gh<_i553.ServiceUpdateRepo>()));
    gh.factory<_i32.GetidregblocBloc>(
        () => _i32.GetidregblocBloc(gh<_i1051.GetIdForDeviceRegRepo>()));
    gh.factory<_i300.TechListBloc>(
        () => _i300.TechListBloc(gh<_i740.TechnitianListRepo>()));
    gh.factory<_i175.AreaBloc>(() => _i175.AreaBloc(gh<_i431.GetAreaRepo>()));
    gh.factory<_i134.CustomerBloc>(
        () => _i134.CustomerBloc(gh<_i509.CustomerRepo>()));
    gh.factory<_i1045.ServiceReqByIdBloc>(
        () => _i1045.ServiceReqByIdBloc(gh<_i231.ServicesReqCallByIdRepo>()));
    gh.factory<_i299.TechPerfomenceBloc>(
        () => _i299.TechPerfomenceBloc(gh<_i5.TechPerfomenceRepo>()));
    gh.factory<_i828.NotifySettingBloc>(
        () => _i828.NotifySettingBloc(gh<_i1001.GetSettingNotifyRepo>()));
    gh.factory<_i600.AuthblocBloc>(
        () => _i600.AuthblocBloc(gh<_i291.AuthRepoReg>()));
    gh.factory<_i91.DeviceregblocBloc>(
        () => _i91.DeviceregblocBloc(gh<_i489.DeviceRegRepo>()));
    return this;
  }
}
