import 'package:ayeenh/features/home/domain/entities/request_model.dart';
import 'package:ayeenh/features/home/presentation/screens/widgets/user_request_item.dart';
import 'package:flutter/material.dart';
class UserRequestsBody extends StatefulWidget {
  const UserRequestsBody({super.key});

  @override
  State<UserRequestsBody> createState() => _UserRequestsBodyState();
}

class _UserRequestsBodyState extends State<UserRequestsBody> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: RequestModel.getRequests.length,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: (context, index) {
        return UserRequestItem(
          userRequestModel: RequestModel.getRequests[index],
        );
      },
    );
  }
}
