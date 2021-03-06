import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:prac/components/clipper.dart';
import 'package:prac/providers/task_provider.dart';
import 'package:prac/utils/app_routes.dart';
import 'package:provider/provider.dart';

class HomeItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _size = MediaQuery.of(context).size;
    final _taskProvider = Provider.of<TaskProvider>(context);
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      child: Column(
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              padding: EdgeInsets.only(
                  left: 15, top: _size.height * 0.05, right: 20, bottom: 0),
              height: _size.height * 0.56,
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    const Color(0xFFC94B4B),
                    const Color(0xFF4b134f),
                  ],
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: _size.height * 0.035),
                  Align(
                    alignment: Alignment.topRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () => Navigator.of(context)
                              .pushNamed(AppRoutes.NOTES_PAGE),
                          child: Text(
                            'NOTES',
                            style: GoogleFonts.nunito(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        InkWell(
                          child: Image.asset(
                            'assets/img/img10.png',
                            width: 20,
                            height: 20,
                          ),
                          onTap: () =>
                              _taskProvider.openAddTaskFormModal(context),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/img/imgtaskpage-grande.png',
                          width: _size.width * 0.6,
                          height: _size.height * 0.6,
                          alignment: Alignment.topLeft,
                          fit: BoxFit.fitWidth,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
