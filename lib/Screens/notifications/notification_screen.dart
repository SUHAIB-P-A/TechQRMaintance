import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techqrmaintance/application/after_accept_reject_bloc/afte_accept_reject_bloc.dart';
import 'package:techqrmaintance/application/servicesrequest/service_request_bloc.dart';
import 'package:techqrmaintance/application/single_user_bloc/single_user_bloc.dart';
import 'package:techqrmaintance/application/spbloc/spbloc_bloc.dart';
import 'package:techqrmaintance/core/colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

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
      backgroundColor: Color(0xfff5f5f5),
      appBar: AppBar(
        backgroundColor: Color(0xfff5f5f5),
        title: Text(
          "Notifications",
          style: TextStyle(
            fontSize: 22,
            color: primaryBlue,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocBuilder<SingleUserBloc, SingleUserState>(
        builder: (context, spstate) {
          return BlocBuilder<ServiceRequestBloc, ServiceRequestState>(
            builder: (context, state) {
              final servlist = state.servicelist
                  .where(
                    (service) =>
                        service.assignedTechnician == spstate.user.id &&
                        service.orgId == spstate.user.orgId &&
                        service.status == "Pending Confirmation",
                  )
                  .toList();

              if (state.isLoading) {
                return Center(
                  child: CircularProgressIndicator(color: primaryBlue),
                );
              }

              if (state.isFailure) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline, size: 48, color: Colors.red),
                      SizedBox(height: 16),
                      Text(
                        "Oops! Something went wrong.",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 8),
                      TextButton(
                        onPressed: () {
                          context.read<ServiceRequestBloc>().add(
                                ServiceRequestEvent.getServicesreq(),
                              );
                        },
                        child: Text("Try Again",
                            style: TextStyle(color: primaryBlue)),
                      ),
                    ],
                  ),
                );
              }

              if (servlist.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.notifications_off_outlined,
                          size: 64, color: Colors.grey),
                      SizedBox(height: 16),
                      Text(
                        "No notifications yet",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[700],
                        ),
                      ),
                    ],
                  ),
                );
              }

              return ListView.separated(
                itemCount: servlist.length,
                separatorBuilder: (context, index) => Divider(
                  height: 1,
                  color: Colors.grey[300],
                  indent: 70,
                ),
                itemBuilder: (context, index) {
                  final notification = servlist[index];

                  return ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    leading: CircleAvatar(
                      radius: 26,
                      backgroundColor: primaryBlue,
                      child: Text(
                        notification.id.toString(),
                        style: TextStyle(
                          color: primaryWhite,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            notification.device!.category!.name.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                              color: Colors.black87,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Preferred Date: ${notification.preferredTimeslot}',
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 14,
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: primaryBlue,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                notification.status.toString(),
                                style: TextStyle(
                                  color: primaryWhite,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                context.read<AfteAcceptRejectBloc>().add(
                                    AfteAcceptRejectEvent.accept(
                                        servid: notification.id.toString()));
                                        
                              },
                              child: Text(
                                "Accept",
                                style: TextStyle(color: primaryBlue),
                              ),
                            ),
                            SizedBox(width: 8),
                            TextButton(
                              onPressed: () {
                                // Handle reject action
                                context.read<AfteAcceptRejectBloc>().add(
                                    AfteAcceptRejectEvent.reject(
                                        servid: notification.id.toString()));
                                        
                              },
                              child: Text(
                                "Reject",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryBlue,
        child: Icon(Icons.refresh, color: primaryWhite),
        onPressed: () {
          context
              .read<ServiceRequestBloc>()
              .add(ServiceRequestEvent.getServicesreq());
        },
      ),
    );
  }
}
