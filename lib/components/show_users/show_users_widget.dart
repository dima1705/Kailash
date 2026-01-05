import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/modal/show_user_account/show_user_account_widget.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'show_users_model.dart';
export 'show_users_model.dart';

class ShowUsersWidget extends StatefulWidget {
  const ShowUsersWidget({
    super.key,
    this.users,
  });

  final List<DocumentReference>? users;

  @override
  State<ShowUsersWidget> createState() => _ShowUsersWidgetState();
}

class _ShowUsersWidgetState extends State<ShowUsersWidget> {
  late ShowUsersModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ShowUsersModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.sizeOf(context).height * 0.5,
      decoration: BoxDecoration(),
      child: Builder(
        builder: (context) {
          final users = widget!.users?.toList() ?? [];

          return GridView.builder(
            padding: EdgeInsets.zero,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1.0,
            ),
            scrollDirection: Axis.vertical,
            itemCount: users.length,
            itemBuilder: (context, usersIndex) {
              final usersItem = users[usersIndex];
              return Builder(
                builder: (context) => StreamBuilder<UsersRecord>(
                  stream: UsersRecord.getDocument(usersItem),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }

                    final containerUsersRecord = snapshot.data!;

                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        await showDialog(
                          context: context,
                          builder: (dialogContext) {
                            return Dialog(
                              elevation: 0,
                              insetPadding: EdgeInsets.zero,
                              backgroundColor: Colors.transparent,
                              alignment: AlignmentDirectional(0.0, 0.0)
                                  .resolve(Directionality.of(context)),
                              child: ShowUserAccountWidget(
                                user: containerUsersRecord.reference,
                              ),
                            );
                          },
                        );
                      },
                      child: Container(
                        width: 70.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 50.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: Image.network(
                                    valueOrDefault<String>(
                                      containerUsersRecord.photoUrl,
                                      'https://firebasestorage.googleapis.com/v0/b/r-bgrushapro-xqprbj.firebasestorage.app/o/tqqpSHs1F-w.jpg?alt=media&token=727cf4d0-ba2b-43e8-93ee-31f290f1cbd2',
                                    ),
                                  ).image,
                                ),
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Color(0xD6D6D6C7),
                                  width: 3.0,
                                ),
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: Text(
                                containerUsersRecord.displayName,
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: Color(0xFFFFF9F9),
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w500,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
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
