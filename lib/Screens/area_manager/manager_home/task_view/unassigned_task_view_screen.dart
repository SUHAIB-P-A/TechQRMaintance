import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techqrmaintance/Screens/Widgets/page_route_animation.dart';
import 'package:techqrmaintance/Screens/tasks/task_overview.dart';
import 'package:techqrmaintance/Screens/tasks/task_screen.dart';
import 'package:techqrmaintance/application/servicesrequest/service_request_bloc.dart';
import 'package:techqrmaintance/application/single_user_bloc/single_user_bloc.dart';
import 'package:techqrmaintance/application/spbloc/spbloc_bloc.dart';
import 'package:techqrmaintance/core/colors.dart';

class UnassignedTaskViewScreen extends StatelessWidget {
  const UnassignedTaskViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
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
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xfff5f5f5),
        title: Text(
          "Unassigned Task View Screen",
          style: TextStyle(
              fontSize: 22, color: primaryBlue, fontWeight: FontWeight.w700),
        ),
      ),
      body: BlocBuilder<SingleUserBloc, SingleUserState>(
        builder: (context, spstate) {
          return BlocBuilder<ServiceRequestBloc, ServiceRequestState>(
            builder: (context, state) {
              if (state.isFailure) {
                return Center(
                  child: Text(
                    "Oops! Something went wrong. Please try again later.",
                  ),
                );
              }
              final servlist = state.servicelist
                  .where((service) =>
                      service.technician == null &&
                      service.assignedTechnician == null &&
                      service.orgId == spstate.user.orgId &&
                      service.status != "Completed")
                  .toList();
              if (servlist.isEmpty) {
                return Center(
                  child: Text("No Data"),
                );
              }
              return ListView(
                children: List.generate(
                  servlist.length,
                  (index) {
                    final services = servlist[index];
                    return TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0.0, end: 1.0),
                      duration: Duration(milliseconds: 500 + (index * 100)),
                      builder: (context, value, child) {
                        return Opacity(
                          opacity: value,
                          child: Transform.translate(
                            offset: Offset(
                              0,
                              50 * (1 - value),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 5,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    createRoute(
                                      TaskOverviewScreen(
                                        currentUserId: services.id.toString(),
                                        key: UniqueKey(),
                                      ),
                                    ),
                                  );
                                },
                                child: MainContainertask(services: services),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
