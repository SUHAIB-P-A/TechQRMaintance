// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:techqrmaintance/Screens/Widgets/page_route_animation.dart';
// import 'package:techqrmaintance/Screens/home/widgets/grid_button.dart';
// import 'package:techqrmaintance/Screens/home/widgets/skelton_home.dart';
// import 'package:techqrmaintance/Screens/home/widgets/task_summary.dart';
// import 'package:techqrmaintance/Screens/portfolio/portfolio_screen.dart';
// import 'package:techqrmaintance/application/notify_setting_bloc/notify_setting_bloc.dart';
// import 'package:techqrmaintance/application/servicesrequest/service_request_bloc.dart';
// import 'package:techqrmaintance/application/single_user_bloc/single_user_bloc.dart';
// import 'package:techqrmaintance/application/spbloc/spbloc_bloc.dart';
// import 'package:techqrmaintance/core/colors.dart';
// import 'package:techqrmaintance/domain/settingnotify/setting_notify_model/notify_model.dart';
// import 'package:techqrmaintance/local_notification/awesome_nitification.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   final List gridList = [
//     GridContainerButton(
//       title: "NOTIFICATION",
//       imagePath: 'assets/images/notification.png',
//     ),
//     GridContainerButton(
//       title: "ADD DEVICE",
//       imagePath: "assets/images/wireless-internet 1.png",
//     ),
//     GridContainerButton(
//       title: "VIEW TASKS",
//       imagePath: "assets/images/task 1.png",
//     ),
//     GridContainerButton(
//       title: "SERVICE\nHISTORY",
//       imagePath: "assets/images/documents 1.png",
//     ),
//   ];

//   @override
//   void initState() {
//     super.initState();

//     WidgetsBinding.instance.addPostFrameCallback(
//       (_) async {
//         context.read<NotifySettingBloc>().add(NotifySettingEvent.getNotify());
//         context
//             .read<ServiceRequestBloc>()
//             .add(ServiceRequestEvent.getServicesreq());
//         context.read<SpblocBloc>().add(SpblocEvent.getSpStoredData());
//         context.read<NotifySettingBloc>().add(NotifySettingEvent.getNotify());
//         context.read<SingleUserBloc>().add(
//               SingleUserEvent.singleUser(
//                 id: context.read<SpblocBloc>().state.userData.toString(),
//               ),
//             );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<NotifySettingBloc, NotifySettingState>(
//       listenWhen: (previous, current) =>
//           previous.notifyList != current.notifyList,
//       listener: (context, state) {
//         if (state.isLoading == false && state.notifyList.isNotEmpty) {
//           final notify = state.notifyList.firstWhere(
//             (element) {
//               return element.orgId ==
//                   context.read<SingleUserBloc>().state.user.orgId;
//             },
//             orElse: () {
//               return NotifyModel();
//             },
//           );
//           log(notify.notificationInterval.toString(),
//               name: "notify model (home)");

//           final intervel = notify.notificationInterval ?? 1;

//           // Schedule notification using the interval
//           NotificationController.requestNotificationPermissions();
//           NotificationController.myNotifyScheduleEvery5Seconds(
//             interval: intervel,
//             title: 'Reminder',
//             msg: 'You have some unfinished tasks!',
//           );
//         }
//       },
//       child: Scaffold(
//         backgroundColor: Color(0xfff5f5f5),
//         appBar: AppBar(
//           backgroundColor: Color(0xfff5f5f5),
//           leading: BlocBuilder<SpblocBloc, SpblocState>(
//             builder: (context, state) {
//               return InkWell(
//                 onTap: () => onPressProfile(context, state.userData.toString()),
//                 child: Icon(
//                   Icons.account_circle_outlined,
//                   size: 35,
//                   color: primaryBlue,
//                 ),
//               );
//             },
//           ),
//           title: Text(
//             "Welcome Technician",
//             style: TextStyle(
//               fontSize: 26,
//               fontWeight: FontWeight.w500,
//               color: primaryBlue,
//             ),
//           ),
//         ),
//         body: RefreshIndicator(
//           triggerMode: RefreshIndicatorTriggerMode.anywhere,
//           onRefresh: onRefresh,
//           child: SingleChildScrollView(
//             physics: AlwaysScrollableScrollPhysics(),
//             scrollDirection: Axis.vertical,
//             child: Column(
//               children: [
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
//                   child: Container(
//                     height: 170,
//                     width: 401,
//                     padding: const EdgeInsets.only(right: 30, left: 20),
//                     decoration: BoxDecoration(
//                       border: Border.all(width: 2, color: primaryBlue),
//                       color: primaryWhite,
//                       borderRadius: BorderRadius.circular(30),
//                     ),
//                     child: BlocBuilder<SingleUserBloc, SingleUserState>(
//                       builder: (context, spState) {
//                         return BlocBuilder<ServiceRequestBloc,
//                             ServiceRequestState>(
//                           builder: (context, state) {
//                             if (state.isLoading) {
//                               return const Center(child: SkeltonHome());
//                             } else if (state.servicelist.isEmpty) {
//                               return Center(
//                                 child: Text(
//                                   "No tasks found",
//                                   style: TextStyle(
//                                     color: primaryBlue,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               );
//                             } else if (state.isFailure) {
//                               return Center(
//                                 child: Text(
//                                   "Oops! Something went wrong. Please try again later.",
//                                   style: TextStyle(
//                                     color: primaryBlue,
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                 ),
//                               );
//                             }
//                             return Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 ContainerTextRow(
//                                   title: "Tasks today:",
//                                   value: state.servicelist
//                                       .where((task) =>
//                                           task.status == "Pending" &&
//                                           task.assignedTechnician ==
//                                               spState.user.id &&
//                                           task.orgId == spState.user.orgId)
//                                       .length
//                                       .toString(),
//                                 ),
//                                 const SizedBox(height: 20),
//                                 ContainerTextRow(
//                                   title: "Pending Tasks:",
//                                   value: state.servicelist
//                                       .where((task) =>
//                                           task.status == "In Progress" &&
//                                           task.assignedTechnician ==
//                                               spState.user.id &&
//                                           task.orgId == spState.user.orgId)
//                                       .length
//                                       .toString(),
//                                 ),
//                                 const SizedBox(height: 20),
//                                 ContainerTextRow(
//                                   title: "Completed Task:",
//                                   value: state.servicelist
//                                       .where((task) =>
//                                           task.status == "Completed" &&
//                                           task.assignedTechnician ==
//                                               spState.user.id &&
//                                           task.orgId == spState.user.orgId)
//                                       .length
//                                       .toString(),
//                                 ),
//                               ],
//                             );
//                           },
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.5,
//                   child: GridView.builder(
//                     //  physics: NeverScrollableScrollPhysics(),
//                     //shrinkWrap: true,
//                     padding: const EdgeInsets.symmetric(horizontal: 10),
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 20,
//                       mainAxisSpacing: 10,
//                       childAspectRatio: 1,
//                     ),
//                     itemCount: gridList.length,
//                     itemBuilder: (context, index) {
//                       return TweenAnimationBuilder(
//                         tween: Tween<double>(begin: 0.0, end: 1.0),
//                         duration: Duration(milliseconds: 500 + (index * 100)),
//                         builder: (context, double value, child) {
//                           return Opacity(
//                             opacity: value,
//                             child: Transform.scale(
//                               scale: value,
//                               child: gridList[index],
//                             ),
//                           );
//                         },
//                       );
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void onPressProfile(BuildContext context, String id) {
//     Navigator.of(context).push(createRoute(PortfolioScreen(id: id)));
//   }

//   Future<void> onRefresh() async {
//     context
//         .read<ServiceRequestBloc>()
//         .add(ServiceRequestEvent.getServicesreq());
//   }
// }

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techqrmaintance/Screens/Widgets/page_route_animation.dart';
import 'package:techqrmaintance/Screens/home/widgets/grid_button.dart';
import 'package:techqrmaintance/Screens/home/widgets/skelton_home.dart';
import 'package:techqrmaintance/Screens/home/widgets/task_summary.dart';
import 'package:techqrmaintance/Screens/portfolio/portfolio_screen.dart';
import 'package:techqrmaintance/application/notify_setting_bloc/notify_setting_bloc.dart';
import 'package:techqrmaintance/application/servicesrequest/service_request_bloc.dart';
import 'package:techqrmaintance/application/single_user_bloc/single_user_bloc.dart';
import 'package:techqrmaintance/application/spbloc/spbloc_bloc.dart';
import 'package:techqrmaintance/core/colors.dart';
import 'package:techqrmaintance/domain/settingnotify/setting_notify_model/notify_model.dart';
import 'package:techqrmaintance/local_notification/awesome_nitification.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List gridList = [
    GridContainerButton(
      title: "NOTIFICATION",
      imagePath: 'assets/images/notification.png',
    ),
    GridContainerButton(
      title: "ADD DEVICE",
      imagePath: "assets/images/wireless-internet 1.png",
    ),
    GridContainerButton(
      title: "VIEW TASKS",
      imagePath: "assets/images/task 1.png",
    ),
    GridContainerButton(
      title: "SERVICE\nHISTORY",
      imagePath: "assets/images/documents 1.png",
    ),
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        context.read<NotifySettingBloc>().add(NotifySettingEvent.getNotify());
        context
            .read<ServiceRequestBloc>()
            .add(ServiceRequestEvent.getServicesreq());
        context.read<SpblocBloc>().add(SpblocEvent.getSpStoredData());
        context.read<NotifySettingBloc>().add(NotifySettingEvent.getNotify());
        context.read<SingleUserBloc>().add(
              SingleUserEvent.singleUser(
                id: context.read<SpblocBloc>().state.userData.toString(),
              ),
            );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<NotifySettingBloc, NotifySettingState>(
      listenWhen: (previous, current) =>
          previous.notifyList != current.notifyList,
      listener: (context, state) {
        if (state.isLoading == false && state.notifyList.isNotEmpty) {
          final notify = state.notifyList.firstWhere(
            (element) {
              return element.orgId ==
                  context.read<SingleUserBloc>().state.user.orgId;
            },
            orElse: () {
              return NotifyModel();
            },
          );
          log(notify.notificationInterval.toString(),
              name: "notify model (home)");

          final intervel = notify.notificationInterval ?? 1;

          // Schedule notification using the interval
          NotificationController.requestNotificationPermissions();
          NotificationController.myNotifyScheduleEvery5Seconds(
            interval: intervel,
            title: 'Reminder',
            msg: 'You have some unfinished tasks!',
          );
        }
      },
      child: Scaffold(
        backgroundColor: Color(0xffF9FAFF),
        body: RefreshIndicator(
          color: primaryBlue,
          backgroundColor: Colors.white,
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          onRefresh: onRefresh,
          child: CustomScrollView(
            physics: AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverAppBar(
                expandedHeight: 130,
                floating: false,
                pinned: true,
                elevation: 0,
                backgroundColor: Color(0xffF9FAFF),
                flexibleSpace: FlexibleSpaceBar(
                  expandedTitleScale: 1.1,
                  titlePadding: EdgeInsets.only(left: 16, bottom: 16),
                  title: Row(
                    children: [
                      BlocBuilder<SpblocBloc, SpblocState>(
                        builder: (context, state) {
                          return GestureDetector(
                            onTap: () => onPressProfile(
                                context, state.userData.toString()),
                            child: Container(
                              padding: EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Color.fromRGBO(
                                      // ignore: deprecated_member_use
                                      primaryBlue.red,
                                      // ignore: deprecated_member_use
                                      primaryBlue.green,
                                      // ignore: deprecated_member_use
                                      primaryBlue.blue,
                                      0.2,
                                    ),
                                    blurRadius: 8,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Icon(
                                Icons.account_circle_outlined,
                                size: 28,
                                color: primaryBlue,
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(width: 16),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey[600],
                            ),
                          ),
                          Text(
                            "Technician",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: primaryBlue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 30),
                  child: _buildTaskSummaryCard(),
                ),
              ),
              SliverPadding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                sliver: SliverToBoxAdapter(
                  child: Row(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: primaryBlue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "Quick Actions",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          height: 2,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                primaryBlue.withOpacity(0.7),
                                Colors.transparent
                              ],
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: 1,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return TweenAnimationBuilder(
                        tween: Tween<double>(begin: 0.0, end: 1.0),
                        duration: Duration(milliseconds: 500 + (index * 100)),
                        curve: Curves.easeOutCubic,
                        builder: (context, double value, child) {
                          return Opacity(
                            opacity: value,
                            child: Transform.translate(
                              offset: Offset(0, 20 * (1 - value)),
                              child: Transform.scale(
                                scale: value,
                                child: gridList[index],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    childCount: gridList.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTaskSummaryCard() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, Color(0xFFF5F9FF)],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(
              primaryBlue.red,
              primaryBlue.green,
              primaryBlue.blue,
              0.15,
            ),
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: BlocBuilder<SingleUserBloc, SingleUserState>(
        builder: (context, spState) {
          return BlocBuilder<ServiceRequestBloc, ServiceRequestState>(
            builder: (context, state) {
              if (state.isLoading) {
                return SizedBox(
                  height: 180,
                  child: const Center(child: SkeltonHome()),
                );
              } else if (state.servicelist.isEmpty) {
                return SizedBox(
                  height: 180,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.assignment_outlined,
                          size: 48,
                          color: Color.fromRGBO(
                            primaryBlue.red,
                            primaryBlue.green,
                            primaryBlue.blue,
                            0.7,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "No tasks found",
                          style: TextStyle(
                            color: primaryBlue,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state.isFailure) {
                return SizedBox(
                  height: 180,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 48,
                          color: Colors.red[400],
                        ),
                        SizedBox(height: 16),
                        Text(
                          "Something went wrong",
                          style: TextStyle(
                            color: Colors.red[700],
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }

              // Count tasks by status
              final todayTasks = state.servicelist
                  .where((task) =>
                      task.status == "Accepted" &&
                      task.assignedTechnician == spState.user.id &&
                      task.orgId == spState.user.orgId)
                  .length;

              final pendingTasks = state.servicelist
                  .where((task) =>
                      task.status == "In Progress" &&
                      task.assignedTechnician == spState.user.id &&
                      task.orgId == spState.user.orgId)
                  .length;

              final completedTasks = state.servicelist
                  .where((task) =>
                      task.status == "Completed" &&
                      task.assignedTechnician == spState.user.id &&
                      task.orgId == spState.user.orgId)
                  .length;

              final totalTasks = todayTasks + pendingTasks + completedTasks;

              return Container(
                padding: EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Task Summary",
                          style: TextStyle(
                            color: primaryBlue,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(
                              primaryBlue.red,
                              primaryBlue.green,
                              primaryBlue.blue,
                              0.1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            "Total: $totalTasks",
                            style: TextStyle(
                              color: primaryBlue,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    _buildTaskStatusRow(
                      title: "Tasks today:",
                      value: todayTasks.toString(),
                      icon: Icons.calendar_today,
                      color: Colors.orange,
                    ),
                    Divider(
                        height: 24, color: Color.fromRGBO(128, 128, 128, 0.2)),
                    _buildTaskStatusRow(
                      title: "Pending Tasks:",
                      value: pendingTasks.toString(),
                      icon: Icons.hourglass_empty,
                      color: Colors.blue,
                    ),
                    Divider(
                        height: 24, color: Color.fromRGBO(128, 128, 128, 0.2)),
                    _buildTaskStatusRow(
                      title: "Completed Tasks:",
                      value: completedTasks.toString(),
                      icon: Icons.check_circle_outline,
                      color: Colors.green,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildTaskStatusRow({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
  }) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color.fromRGBO(
              color.red,
              color.green,
              color.blue,
              0.1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(
            icon,
            size: 22,
            color: color,
          ),
        ),
        SizedBox(width: 16),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[800],
            fontWeight: FontWeight.w500,
          ),
        ),
        Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.05),
                blurRadius: 4,
                offset: Offset(0, 2),
              ),
            ],
          ),
          child: Text(
            value,
            style: TextStyle(
              color: primaryBlue,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }

  void onPressProfile(BuildContext context, String id) {
    Navigator.of(context).push(createRoute(PortfolioScreen(id: id)));
  }

  Future<void> onRefresh() async {
    context
        .read<ServiceRequestBloc>()
        .add(ServiceRequestEvent.getServicesreq());
  }
}
