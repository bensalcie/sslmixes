import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sslmixes/features/mixes/data/models/mixes_body.dart';
import 'package:sslmixes/features/mixes/presentation/bloc/get_mixes_bloc.dart';
import 'package:sslmixes/features/mixes/presentation/widgets/app_textview_small.dart';
import 'package:sslmixes/features/mixes/presentation/widgets/single_mix_card.dart';

class MixesPage extends StatefulWidget {
  const MixesPage({super.key});

  @override
  State<MixesPage> createState() => _MixesPageState();
}

class _MixesPageState extends State<MixesPage> {
  @override
  void initState() {
    super.initState();
    _fetchMixes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const AppTextViewSubtitleSmall(
            fontSize: 22, text: 'Mixes SSL', textAlign: TextAlign.start),
        iconTheme: const IconThemeData(size: 24),
        titleSpacing: 20,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            BlocBuilder<GetMixesBloc, GetMixesState>(
              builder: (context, state) {
                if (state is GetMixesFailed) {
                  return Center(
                      child: AppTextViewSubtitleSmall(
                    text: state.errorMessage,
                    textAlign: TextAlign.center,
                  ));
                }
                if (state is GetMixesLoading) {
                  return const Center(
                      child: CircularProgressIndicator.adaptive());
                }

                if (state is GetMixesSuccess) {
                  final mixes = state.result?.mixes ?? [];
                  return mixes.isNotEmpty
                      ? GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2),
                          itemCount: mixes.length,
                          itemBuilder: (context, index) => SingleMixCard(
                            mixes: mixes,
                            index: index,
                          ),
                        )
                      : const Center(
                          child: AppTextViewSubtitleSmall(
                            text: 'Nothing yet :)',
                            textAlign: TextAlign.center,
                          ),
                        );
                }

                return const Center(
                    child: AppTextViewSubtitleSmall(
                  text: 'Nothing yet :)',
                  textAlign: TextAlign.center,
                ));
              },
            ),
            const SizedBox(
              height: 10,
            )
          ]),
        ),
      ),
    );
  }

  void _fetchMixes() {
    context.read<GetMixesBloc>().add(
        GetMixes(mixsearchparams: MixBody(limit: 15, search: '', page: 1)));
  }
}
