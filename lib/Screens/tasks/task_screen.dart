// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:techqrmaintance/Screens/Widgets/page_route_animation.dart';
// import 'package:techqrmaintance/Screens/Widgets/skelton.dart';
// import 'package:techqrmaintance/Screens/tasks/task_overview.dart';
// import 'package:techqrmaintance/application/servicesrequest/service_request_bloc.dart';
// import 'package:techqrmaintance/application/single_user_bloc/single_user_bloc.dart';
// import 'package:techqrmaintance/application/spbloc/spbloc_bloc.dart';
// import 'package:techqrmaintance/core/colors.dart';
// import 'package:techqrmaintance/core/imageurls.dart';
// import 'package:techqrmaintance/domain/servicerequestmodel/services_request_saas/services_model.dart';

// class TaskScreen extends StatelessWidget {
//   final String? title;
//   const TaskScreen({super.key, this.title});

//   @override
//   Widget build(BuildContext context) {
//     WidgetsBinding.instance.addPostFrameCallback(
//       (_) async {
//         context
//             .read<ServiceRequestBloc>()
//             .add(ServiceRequestEvent.getServicesreq());
//         context.read<SpblocBloc>().add(SpblocEvent.getSpStoredData());
//         context.read<SingleUserBloc>().add(
//               SingleUserEvent.singleUser(
//                 id: context.read<SpblocBloc>().state.userData.toString(),
//               ),
//             );
//       },
//     );

//     return Scaffold(
//       backgroundColor: Color(0xfff5f5f5),
//       appBar: AppBar(
//         backgroundColor: Color(0xfff5f5f5),
//         title: Text(
//           "Tasks",
//           style: TextStyle(
//             fontSize: 24,
//             color: primaryBlue,
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: BlocBuilder<SingleUserBloc, SingleUserState>(
//         builder: (context, spstate) {
//           return BlocBuilder<ServiceRequestBloc, ServiceRequestState>(
//             builder: (context, state) {
//               if (state.isFailure) {
//                 return Center(
//                   child: Text(
//                     "Oops! Something went wrong. Please try again later.",
//                   ),
//                 );
//               }
//               final servlist = state.servicelist
//                   .where(
//                     (service) =>
//                         service.assignedTechnician == spstate.user.id &&
//                         service.orgId == spstate.user.orgId &&
//                         (service.status == "Pending" ||
//                             service.status == "In Progress"),
//                   )
//                   .toList();
//               if (servlist.isEmpty) {
//                 return Center(
//                   child: Text("No Data"),
//                 );
//               }
//               return RefreshIndicator(
//                 onRefresh: () =>  onRefreshTask(context),
//                 child: ListView(
//                   children: List.generate(
//                     servlist.length,
//                     (index) {
//                       final services = servlist[index];
//                       return state.isLoading
//                           ? Padding(
//                               padding: const EdgeInsets.all(10),
//                               child: Skeleton(
//                                 height: 300,
//                                 width: double.infinity,
//                                 color: primaryWhite,
//                               ),
//                             )
//                           : TweenAnimationBuilder(
//                               tween: Tween<double>(begin: 0.0, end: 1.0),
//                               duration: Duration(milliseconds: 500),
//                               builder: (context, double value, child) {
//                                 return Opacity(
//                                   opacity: value,
//                                   child: Transform.translate(
//                                     offset: Offset(0, 50 * (1 - value)),
//                                     child: Padding(
//                                       padding: const EdgeInsets.symmetric(
//                                         horizontal: 10,
//                                       ),
//                                       child: GestureDetector(
//                                         onTap: () {
//                                           Navigator.of(context).push(
//                                               createRoute(TaskOverviewScreen(
//                                             serialNo:
//                                                 services.device?.serialNumber,
//                                             title: title,
//                                             currentUserId:
//                                                 services.id.toString(),
//                                             key: UniqueKey(),
//                                           )));
//                                         },
//                                         child: MainContainertask(
//                                           services: services,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 );
//                               },
//                             );
//                     },
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }

//   Future<void> onRefreshTask(BuildContext ctx) async {
//     ctx.read<ServiceRequestBloc>().add(ServiceRequestEvent.getServicesreq());
//   }
// }

// class MainContainertask extends StatelessWidget {
//   const MainContainertask({
//     super.key,
//     required this.services,
//   });

//   final ServicesModel services;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30),
//           color: const Color(0xff165069),
//         ),
//         child: Column(
//           children: [
//             Container(
//               width: double.infinity,
//               height: 150,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30),
//                   topRight: Radius.circular(30),
//                 ),
//                 color: Color(0xFFF5F5F5),
//                 image: DecorationImage(
//                   fit: BoxFit.contain,
//                   scale: 50,
//                   image: AssetImage(
//                     "assets/images/technician.png",
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(
//               height: 5,
//             ),
//             Padding(
//               padding: const EdgeInsets.only(left: 20, bottom: 10),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Job Type : ${services.jobType}",
//                     style: TextStyle(
//                       color: primaryWhite,
//                       fontSize: 22,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   TaskBuildRow(
//                     icon: Icons.devices,
//                     text: "${services.device?.category?.name}",
//                   ),
//                   TaskBuildRow(
//                       icon: Icons.person,
//                       text: "${services.customer?.fullName}"),
//                   TaskBuildRow(
//                       icon: Icons.pending_actions, text: "${services.status}"),
//                   TaskBuildRow(
//                       icon: Icons.access_time,
//                       text: "${services.preferredTimeslot}"),
//                   TaskBuildRow(
//                       icon: Icons.flag,
//                       text: "${services.emergency}" == "1"
//                           ? "High priority"
//                           : "Low priority"),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class TaskBuildRow extends StatelessWidget {
//   final IconData icon;
//   final String text;
//   const TaskBuildRow({
//     super.key,
//     required this.icon,
//     required this.text,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 6),
//       child: Row(
//         children: [
//           Icon(
//             icon,
//             size: 16,
//             color: text == "High priority" ? Colors.red : primaryWhite,
//           ),
//           const SizedBox(width: 8),
//           Expanded(
//             child: Text(
//               text,
//               style: TextStyle(
//                 fontSize: 16,
//                 fontWeight: FontWeight.w600,
//                 color: text == "High priority" ? Colors.red : primaryWhite,
//               ),
//               maxLines: 1,
//               overflow: TextOverflow.ellipsis,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techqrmaintance/Screens/Widgets/page_route_animation.dart';
import 'package:techqrmaintance/Screens/Widgets/skelton.dart';
import 'package:techqrmaintance/Screens/tasks/task_overview.dart';
import 'package:techqrmaintance/application/servicesrequest/service_request_bloc.dart';
import 'package:techqrmaintance/application/single_user_bloc/single_user_bloc.dart';
import 'package:techqrmaintance/application/spbloc/spbloc_bloc.dart';
import 'package:techqrmaintance/core/colors.dart';
import 'package:techqrmaintance/domain/servicerequestmodel/services_request_saas/services_model.dart';

class TaskScreen extends StatelessWidget {
  final String? title;
  const TaskScreen({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) async {
        context
            .read<ServiceRequestBloc>()
            .add(ServiceRequestEvent.getServicesreq());
        context.read<SpblocBloc>().add(SpblocEvent.getSpStoredData());
        context.read<SingleUserBloc>().add(
              SingleUserEvent.singleUser(
                id: context.read<SpblocBloc>().state.userData.toString(),
              ),
            );
      },
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        shadowColor: Colors.black.withOpacity(0.05),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: primaryBlue),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          "My Tasks",
          style: TextStyle(
            fontSize: 20,
            color: primaryBlue,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: primaryBlue),
            onPressed: () => onRefreshTask(context),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: _buildTaskList(),
        ),
      ),
    );
  }

  Widget _buildTaskList() {
    return BlocBuilder<SingleUserBloc, SingleUserState>(
      builder: (context, spstate) {
        return BlocBuilder<ServiceRequestBloc, ServiceRequestState>(
          builder: (context, state) {
            if (state.isFailure) {
              return _buildErrorState(context);
            }

            final servlist = state.servicelist
                .where(
                  (service) =>
                      service.assignedTechnician == spstate.user.id &&
                      service.orgId == spstate.user.orgId &&
                      (service.status == "Accepted" ||
                          service.status == "In Progress"),
                )
                .toList();

            if (servlist.isEmpty) {
              return _buildEmptyState(context);
            }

            return RefreshIndicator(
              color: const Color(0xFF2A7299),
              backgroundColor: Colors.white,
              strokeWidth: 2,
              onRefresh: () => onRefreshTask(context),
              child: ListView.builder(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 4, bottom: 20),
                itemCount: servlist.length,
                itemBuilder: (context, index) {
                  final services = servlist[index];

                  return state.isLoading
                      ? _buildLoadingSkeleton()
                      : _buildTaskCard(context, services, index);
                },
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildTaskCard(
      BuildContext context, ServicesModel services, int index) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 350),
      curve: Curves.easeOut,
      builder: (context, double value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 20 * (1 - value)),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(createRoute(TaskOverviewScreen(
                    serialNo: services.device?.serialNumber,
                    title: title,
                    currentUserId: services.id.toString(),
                    key: UniqueKey(),
                  )));
                },
                child: MainContainertask(services: services),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildLoadingSkeleton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Skeleton(
        height: 160,
        width: double.infinity,
        color: Colors.white,
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.assignment_outlined,
            size: 70,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            "No Tasks Available",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Pull down to refresh",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 70,
            color: Colors.red.shade300,
          ),
          const SizedBox(height: 16),
          const Text(
            "Oops! Something went wrong.",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Please try again later",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => onRefreshTask(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2A7299),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text("Refresh"),
          ),
        ],
      ),
    );
  }

  Future<void> onRefreshTask(BuildContext ctx) async {
    ctx.read<ServiceRequestBloc>().add(ServiceRequestEvent.getServicesreq());
  }
}

class MainContainertask extends StatelessWidget {
  const MainContainertask({
    super.key,
    required this.services,
  });

  final ServicesModel services;

  @override
  Widget build(BuildContext context) {
    final bool isHighPriority = "${services.emergency}" == "1";
    final String statusText = "${services.status}";

    // Define status color based on current status
    Color getStatusColor() {
      switch (statusText) {
        case "In Progress":
          return Colors.orange;
        case "Pending":
          return Colors.blue;
        default:
          return Colors.green;
      }
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header - Job Type and Priority
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isHighPriority
                  ? const Color(0xFFFFF5F5)
                  : const Color(0xFFF5F9FF),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  isHighPriority ? Icons.warning_rounded : Icons.build_rounded,
                  color:
                      isHighPriority ? Colors.redAccent : Colors.orangeAccent,
                  size: 18,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "${services.jobType}",
                    style: TextStyle(
                      color: isHighPriority ? Colors.redAccent : Colors.black87,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (isHighPriority)
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Colors.red.shade100,
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.priority_high,
                          size: 12,
                          color: Colors.red,
                        ),
                        SizedBox(width: 2),
                        Text(
                          "URGENT",
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),

          // Content - Device details
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Device name
                Text(
                  "${services.device?.category?.name}",
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF333333),
                  ),
                ),
                const SizedBox(height: 12),

                // Customer & Date
                Row(
                  children: [
                    // Customer
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.person_outline,
                            size: 16,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              "${services.customer?.fullName}",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Preferred time
                    Expanded(
                      child: Row(
                        children: [
                          const Icon(
                            Icons.access_time,
                            size: 16,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              "${services.preferredTimeslot}",
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const Divider(height: 1),

          // Footer - Status and View Details
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Status indicator
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: getStatusColor(),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      "Status: $statusText",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: getStatusColor(),
                      ),
                    ),
                  ],
                ),

                // View Details button
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A7299),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "View Details",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(
                        Icons.arrow_forward,
                        size: 12,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
