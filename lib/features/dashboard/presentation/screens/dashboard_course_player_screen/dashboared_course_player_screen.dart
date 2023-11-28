import 'package:edtech_app/features/dashboard/domain/entities/dashboard_course_details_entity.dart';
import 'package:edtech_app/features/dashboard/domain/use_cases/get_dashboard_course_details.dart';
import 'package:edtech_app/features/dashboard/presentation/business_logic/dashboard_course_certificate_bloc/dashboard_course_certificate_bloc.dart';
import 'package:edtech_app/features/dashboard/presentation/business_logic/dashboard_course_details_bloc/dashboard_course_details_bloc.dart';
import 'package:edtech_app/features/dashboard/presentation/screens/views/dashboard_leading_view.dart';
import 'package:edtech_app/features/dashboard/presentation/screens/views/dashboard_title_view.dart';
import 'package:edtech_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DashboardCoursePlayerScreen extends StatefulWidget {
  const DashboardCoursePlayerScreen({super.key});

  @override
  State<DashboardCoursePlayerScreen> createState() =>
      _DashboardCoursePlayerScreenState();
}

class _DashboardCoursePlayerScreenState
    extends State<DashboardCoursePlayerScreen> {
  @override
  void initState() {
    context
        .read<DashboardCourseDetailsBloc>()
        .add(DashboardCourseDetailsEventFetchData());
    super.initState();
  }

  @override
  void dispose() {
    DashboardCourseDetailsBloc(
      getDashboardCourseDetails: sl<GetDashboardCourseDetails>(),
    ).close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const DashboardTitleView(title: 'Course Details'),
        leading: const DashboardLeadingView(),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 12)),
            const SliverToBoxAdapter(
              child: VideoPlayerView(),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 12)),
            BlocBuilder<DashboardCourseDetailsBloc,
                DashboardCourseDetailsState>(
              builder: (context, courseDetailsState) {
                if (courseDetailsState is DashboardCourseDetailsLoaded) {
                  return SliverList.separated(
                    itemCount: courseDetailsState.courseDetailsEntity.length,
                    itemBuilder: (context, index) => ModuleItemView(
                      courseDetailsEntity:
                          courseDetailsState.courseDetailsEntity[index],
                    ),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 8),
                  );
                }
                return SliverList.separated(
                  itemCount: 10,
                  itemBuilder: (context, index) => Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      margin:
                          const EdgeInsets.only(bottom: 8, left: 12, right: 12),
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 8),
                );
              },
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: 100),
            ),
          ],
        ),
      ),
    );
  }
}

class ModuleItemView extends StatefulWidget {
  const ModuleItemView({
    super.key,
    required this.courseDetailsEntity,
  });

  final DashboardCourseDetailsEntity courseDetailsEntity;

  @override
  State<ModuleItemView> createState() => _ModuleItemViewState();
}

class _ModuleItemViewState extends State<ModuleItemView> {
  bool moduleHasFinished = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      child: ExpansionTile(
        tilePadding: const EdgeInsets.only(right: 8),
        leading: Checkbox(
          value: moduleHasFinished,
          onChanged: (bool? value) {
            if (value != null) {
              moduleHasFinished = value;
              context.read<DashboardCourseCertificateBloc>().add(
                  DashboardCourseCertificateEventUpdateData(
                      courseDetailsEntity: widget.courseDetailsEntity));
              setState(() {});
            }
          },
        ),
        shape: const Border(),
        title: Text(widget.courseDetailsEntity.module),
        children: [
          CustomScrollView(
            shrinkWrap: true,
            primary: false,
            slivers: [
              SliverList.builder(
                itemCount: widget.courseDetailsEntity.content.length,
                itemBuilder: (context, index) => InkWell(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: index.isEven ? Colors.green.withOpacity(0.07) : null,
                    child: Row(
                      children: [
                        Icon(
                          Icons.play_circle,
                          size: 24,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child:
                              Text(widget.courseDetailsEntity.content[index]),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
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
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: 'ZONoMgeGAbI',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
    super.initState();

  }


  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
          aspectRatio: 16/8,
          child: YoutubePlayer(
            controller: _controller,
            bottomActions: [
              CurrentPosition(),
              ProgressBar(isExpanded: true),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                    color: Theme.of(context).colorScheme.primary),
                minimumSize: Size.zero, // Set this
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
              ),
              child: const Text('Previous'),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                    color: Theme.of(context).colorScheme.primary),
                minimumSize: Size.zero, // Set this
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
              ),
              child: const Text('Next'),
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: BorderSide(
                    color: Theme.of(context).colorScheme.primary),
                minimumSize: Size.zero, // Set this
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 4,
                ),
              ),
              child: const Text('Bookmark'),
            ),
          ],
        )
      ],
    );
  }
}
