import 'package:techqrmaintance/Screens/splash/splash_screen.dart';
import 'package:techqrmaintance/application/GetLocation/get_location_bloc.dart';
import 'package:techqrmaintance/application/Tokenbloc/get_token_bloc.dart';
import 'package:techqrmaintance/application/after_accept_reject_bloc/afte_accept_reject_bloc.dart';
import 'package:techqrmaintance/application/area_bloc/area_bloc.dart';
import 'package:techqrmaintance/application/authbloc/authbloc_bloc.dart';
import 'package:techqrmaintance/application/brandnadmodel/brand_and_model_bloc.dart';
import 'package:techqrmaintance/application/catagorybloc/catogory_bloc.dart';
import 'package:techqrmaintance/application/checkbloc/checkbloc_bloc.dart';
import 'package:techqrmaintance/application/custbloc/customer_bloc.dart';
import 'package:techqrmaintance/application/deviceregbloc/deviceregbloc_bloc.dart';
import 'package:techqrmaintance/application/docuploadbloc/doc_upload_bloc.dart';
import 'package:techqrmaintance/application/getidregbloc/getidregbloc_bloc.dart';
import 'package:techqrmaintance/application/inventry_bloc/inventry_bloc.dart';
import 'package:techqrmaintance/application/logbloc/logbloc_bloc.dart';
import 'package:techqrmaintance/application/modelandbrand/model_and_brand_bloc.dart';
import 'package:techqrmaintance/application/notify_setting_bloc/notify_setting_bloc.dart';
import 'package:techqrmaintance/application/orgganizationbloc/oranization_bloc.dart';
import 'package:techqrmaintance/application/pdf_upload_bloc/pdf_upload_bloc.dart';
import 'package:techqrmaintance/application/requestscanqrbloc/request_scan_qr_endpoind_bloc.dart';
import 'package:techqrmaintance/application/servicereqbyidbloc/service_req_by_id_bloc.dart';
import 'package:techqrmaintance/application/servicesrequest/service_request_bloc.dart';
import 'package:techqrmaintance/application/single_user_bloc/single_user_bloc.dart';
import 'package:techqrmaintance/application/spbloc/spbloc_bloc.dart';
import 'package:techqrmaintance/application/techlistbloc/tech_list_bloc.dart';
import 'package:techqrmaintance/application/techperfomancebloc/tech_perfomence_bloc.dart';
import 'package:techqrmaintance/application/update_user_bloc/update_user_bloc.dart';
import 'package:techqrmaintance/application/updateservicebloc/update_service_req_bloc.dart';
import 'package:techqrmaintance/domain/core/di/injuctable.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techqrmaintance/local_notification/awesome_nitification.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  configinjuction();
  await NotificationController.initializeLocalNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getit<AuthblocBloc>(),
        ),
        BlocProvider(
          create: (context) => getit<LogblocBloc>(),
        ),
        BlocProvider(
          create: (context) => getit<SpblocBloc>(),
        ),
        BlocProvider(
          create: (context) => getit<CheckblocBloc>(),
        ),
        BlocProvider(
          create: (context) => getit<DeviceregblocBloc>(),
        ),
        BlocProvider(
          create: (context) => getit<GetidregblocBloc>(),
        ),
        BlocProvider(
          create: (context) => getit<CustomerBloc>(),
        ),
        BlocProvider(
          create: (context) => getit<GetLocationBloc>(),
        ),
        BlocProvider(
          create: (context) => getit<OranizationBloc>(),
        ),
        BlocProvider(
          create: (context) => getit<CatogoryBloc>(),
        ),
        BlocProvider(
          create: (context) => getit<RequestScanQrEndpoindBloc>(),
        ),
        BlocProvider(
          create: (context) => getit<BrandAndModelBloc>(),
        ),
        BlocProvider(
          create: (context) => getit<ModelAndBrandBloc>(),
        ),
        BlocProvider(
          create: (context) => getit<ServiceRequestBloc>(),
        ),
        BlocProvider(
          create: (context) => getit<ServiceReqByIdBloc>(),
        ),
        BlocProvider(
          create: (context) => getit<TechPerfomenceBloc>(),
        ),
        BlocProvider(
          create: (context) => getit<UpdateServiceReqBloc>(),
        ),
        BlocProvider(
          create: (context) => getit<TechListBloc>(),
        ),
        BlocProvider(
          create: (context) => getit<GetTokenBloc>(),
        ),
        BlocProvider(
          create: (context) => getit<DocUploadBloc>(),
        ),
        BlocProvider(
          create: (context) => getit<PdfUploadBloc>(),
        ),
        BlocProvider(
          create: (context) => getit<AfteAcceptRejectBloc>(),
        ),
        BlocProvider(
          create: (context) => getit<InventryBloc>(),
        ),
        BlocProvider(
          create: (context) => getit<NotifySettingBloc>(),
        ),
        BlocProvider(
          create: (context) => getit<UpdateUserBloc>(),
        ),
        BlocProvider(
          create: (context) => getit<SingleUserBloc>(),
        ),
        BlocProvider(
          create: (context) => getit<AreaBloc>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Qloop',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple,
          ),
          useMaterial3: true,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
