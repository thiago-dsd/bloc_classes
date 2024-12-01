import 'package:bloc_classes/bloc/posts/posts_bloc.dart';
import 'package:bloc_classes/model/posts_model.dart';
import 'package:bloc_classes/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({super.key});

  @override
  State<PostsScreen> createState() => _PostsScreenState();
}

class _PostsScreenState extends State<PostsScreen> {
  @override
  void initState() {
    context.read<PostsBloc>().add(PostFetched());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post API's"),
      ),
      body: BlocBuilder<PostsBloc, PostsState>(
        builder: (context, state) {
          switch (state.postStatus) {
            case PostStatus.success:
              return Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                        hintText: "Search with email",
                        border: OutlineInputBorder()),
                    onChanged: (filterKey) {
                      context.read<PostsBloc>().add(SearchItem(filterKey));
                    },
                  ),
                  Expanded(
                    child: state.searchMessage.isNotEmpty
                        ? Center(child: Text(state.searchMessage.toString()))
                        : ListView.builder(
                            itemCount: state.temPostList.isEmpty
                                ? state.postList.length
                                : state.temPostList.length,
                            itemBuilder: (context, index) {
                              if (state.temPostList.isEmpty) {
                                final PostModel currentPost =
                                    state.postList[index];
                                return ListTile(
                                  title: Text(currentPost.email.toString()),
                                  subtitle: Text(currentPost.name.toString()),
                                );
                              } else {
                                final PostModel currentPost =
                                    state.temPostList[index];
                                return ListTile(
                                  title: Text(currentPost.email.toString()),
                                  subtitle: Text(currentPost.name.toString()),
                                );
                              }
                            }),
                  ),
                ],
              );
            case PostStatus.failure:
              return Center(
                  child: Text(
                state.message.toString(),
                overflow: TextOverflow.ellipsis,
              ));
            case PostStatus.loading:
              return const Center(child: CircularProgressIndicator());
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
