import 'package:edtech_app/features/dashboard/presentation/screens/views/dashboard_leading_view.dart';
import 'package:edtech_app/features/dashboard/presentation/screens/views/dashboard_title_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DashboardCoursePlayerScreen extends StatefulWidget {
  const DashboardCoursePlayerScreen({super.key});

  @override
  State<DashboardCoursePlayerScreen> createState() => _DashboardCoursePlayerScreenState();
}

class _DashboardCoursePlayerScreenState extends State<DashboardCoursePlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DashboardTitleView(title: 'Course Details'),
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.dashboard,
            size: 24,
            color: Colors.white,
          ),
        ),
        toolbarHeight: 56,
        backgroundColor: Theme.of(context).colorScheme.primary,
        systemOverlayStyle: SystemUiOverlayStyle.light,
        automaticallyImplyLeading: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bookmark,
              size: 24,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: VideoPlayerView(),
          ),
        ],
      ),
    );
  }
}

class VideoPlayerView extends StatefulWidget {
  const VideoPlayerView({super.key});

  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
