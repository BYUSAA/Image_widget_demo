import 'package:flutter/material.dart';

void main() => runApp(const CampusConnectApp());

class CampusConnectApp extends StatelessWidget {
  const CampusConnectApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CampusConnect',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4F6F8),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF172033)),
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  double imageWidth = 190;
  double imageHeight = 190;
  BoxFit imageFit = BoxFit.cover;
  bool showDefault = false;

  void resetDemo() {
    setState(() {
      imageWidth = 190;
      imageHeight = 190;
      imageFit = BoxFit.cover;
      showDefault = false;
    });
  }

  String get fitName {
    switch (imageFit) {
      case BoxFit.cover: return 'cover';
      case BoxFit.contain: return 'contain';
      case BoxFit.fill: return 'fill';
      case BoxFit.fitWidth: return 'fitWidth';
      case BoxFit.fitHeight: return 'fitHeight';
      case BoxFit.none: return 'none';
      case BoxFit.scaleDown: return 'scaleDown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          final wide = constraints.maxWidth >= 850;
          return SingleChildScrollView(
            child: Column(children: [
              _topBar(),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 24, 20, 40),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1120),
                  child: wide
                      ? Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Expanded(flex: 6, child: _profileCard()),
                          const SizedBox(width: 22),
                          Expanded(flex: 5, child: _demoCard()),
                        ])
                      : Column(children: [_profileCard(), const SizedBox(height: 22), _demoCard()]),
                ),
              ),
            ]),
          );
        }),
      ),
    );
  }

  Widget _topBar() => Container(
        width: double.infinity,
        color: const Color(0xFF172033),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 16),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1120),
          child: Row(children: [
            const Icon(Icons.school_rounded, color: Colors.white, size: 30),
            const SizedBox(width: 12),
            const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('CampusConnect', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w800)),
              Text('Student profile', style: TextStyle(color: Color(0xFFB9C3D4), fontSize: 12)),
            ])),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(color: const Color(0xFF2B3952), borderRadius: BorderRadius.circular(20)),
              child: const Row(children: [Icon(Icons.circle, size: 8, color: Color(0xFF56D364)), SizedBox(width: 7), Text('Active', style: TextStyle(color: Colors.white, fontSize: 12))]),
            ),
          ]),
        ),
      );

  Widget _profileCard() => Card(
        elevation: 0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24), side: const BorderSide(color: Color(0xFFE0E5EA))),
        child: Column(children: [
          Container(height: 112, width: double.infinity, decoration: const BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF172033), Color(0xFF34445F)])), child: const Align(alignment: Alignment.topRight, child: Padding(padding: EdgeInsets.all(22), child: Icon(Icons.more_horiz, color: Colors.white)))),
          Transform.translate(
            offset: const Offset(0, -62),
            child: Column(children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: ClipOval(
                  child: SizedBox(
                    width: imageWidth,
                    height: imageHeight,
                    child: Image.asset('assets/student_profile.png', width: showDefault ? null : imageWidth, height: showDefault ? null : imageHeight, fit: imageFit),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text('Martin De Poles', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800, color: Color(0xFF172033))),
              const SizedBox(height: 5),
              const Text('Software Engineering • Year 3', style: TextStyle(color: Color(0xFF667085), fontSize: 14)),
              const SizedBox(height: 12),
              Container(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6), decoration: BoxDecoration(color: const Color(0xFFE9F7EF), borderRadius: BorderRadius.circular(20)), child: const Text('Student ID: ALU-2026-001', style: TextStyle(color: Color(0xFF207A46), fontWeight: FontWeight.w700, fontSize: 12))),
              const SizedBox(height: 24),
              const Divider(height: 1),
              Padding(padding: const EdgeInsets.fromLTRB(22, 20, 22, 22), child: Column(children: [
                _info(Icons.location_on_outlined, 'Campus', 'Kigali, Rwanda'),
                const SizedBox(height: 14),
                _info(Icons.email_outlined, 'Email', 'martin@student.example'),
                const SizedBox(height: 14),
                _info(Icons.code_rounded, 'Focus', 'Flutter • Full Stack • AI'),
                const SizedBox(height: 22),
                Row(children: [Expanded(child: OutlinedButton.icon(onPressed: () {}, icon: const Icon(Icons.edit_outlined), label: const Text('Edit profile'))), const SizedBox(width: 10), Expanded(child: FilledButton.icon(onPressed: () {}, icon: const Icon(Icons.share_outlined), label: const Text('Share')))]),
              ])),
            ]),
          ),
        ]),
      );

  Widget _info(IconData icon, String title, String value) => Row(children: [
        Container(width: 40, height: 40, decoration: BoxDecoration(color: const Color(0xFFF0F3F7), borderRadius: BorderRadius.circular(11)), child: Icon(icon, size: 20, color: const Color(0xFF34445F))),
        const SizedBox(width: 12),
        Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontSize: 11, color: Color(0xFF98A2B3), fontWeight: FontWeight.w700)), const SizedBox(height: 2), Text(value, style: const TextStyle(fontSize: 14, color: Color(0xFF344054), fontWeight: FontWeight.w600))])),
      ]);

  Widget _demoCard() => Card(
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24), side: const BorderSide(color: Color(0xFFE0E5EA))),
        child: Padding(padding: const EdgeInsets.all(22), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(children: [Container(width: 42, height: 42, decoration: BoxDecoration(color: const Color(0xFFEFF2F6), borderRadius: BorderRadius.circular(12)), child: const Icon(Icons.tune_rounded, color: Color(0xFF172033))), const SizedBox(width: 12), const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Image Widget Lab', style: TextStyle(fontSize: 19, fontWeight: FontWeight.w800)), Text('Live property demonstration', style: TextStyle(color: Color(0xFF667085), fontSize: 12))]))]),
          const SizedBox(height: 20),
          Container(padding: const EdgeInsets.all(14), decoration: BoxDecoration(color: const Color(0xFF172033), borderRadius: BorderRadius.circular(15)), child: Row(children: [const Icon(Icons.compare_arrows_rounded, color: Colors.white), const SizedBox(width: 10), const Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Default behavior', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)), Text('Image without width, height or fit', style: TextStyle(color: Color(0xFFB9C3D4), fontSize: 11))])), Switch(value: showDefault, onChanged: (v) => setState(() => showDefault = v), activeColor: Colors.white)])),
          const SizedBox(height: 18),
          _header('01', 'width', '${imageWidth.round()} px'),
          Slider(value: imageWidth, min: 100, max: 270, divisions: 17, label: '${imageWidth.round()} px', onChanged: (v) => setState(() { imageWidth = v; showDefault = false; })),
          const SizedBox(height: 8),
          _header('02', 'height', '${imageHeight.round()} px'),
          Slider(value: imageHeight, min: 100, max: 270, divisions: 17, label: '${imageHeight.round()} px', onChanged: (v) => setState(() { imageHeight = v; showDefault = false; })),
          const SizedBox(height: 14),
          _header('03', 'fit', 'BoxFit.$fitName'),
          const SizedBox(height: 8),
          DropdownButtonFormField<BoxFit>(
            value: imageFit,
            decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)), contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 13)),
            items: const [DropdownMenuItem(value: BoxFit.cover, child: Text('BoxFit.cover')), DropdownMenuItem(value: BoxFit.contain, child: Text('BoxFit.contain')), DropdownMenuItem(value: BoxFit.fill, child: Text('BoxFit.fill')), DropdownMenuItem(value: BoxFit.fitWidth, child: Text('BoxFit.fitWidth')), DropdownMenuItem(value: BoxFit.fitHeight, child: Text('BoxFit.fitHeight'))],
            onChanged: (v) => setState(() { if (v != null) { imageFit = v; showDefault = false; } }),
          ),
          const SizedBox(height: 18),
          Container(width: double.infinity, padding: const EdgeInsets.all(15), decoration: BoxDecoration(color: const Color(0xFFF7F8FA), borderRadius: BorderRadius.circular(14)), child: Text(showDefault ? 'DEFAULT MODE\nwidth: not specified\nheight: not specified\nfit: not specified' : 'CURRENT IMAGE.ASSET\nwidth: ${imageWidth.round()} px\nheight: ${imageHeight.round()} px\nfit: BoxFit.$fitName', style: const TextStyle(fontFamily: 'monospace', fontSize: 12, height: 1.55, color: Color(0xFF344054)))),
          const SizedBox(height: 14),
          Row(children: [Expanded(child: OutlinedButton(onPressed: resetDemo, child: const Text('Reset'))), const SizedBox(width: 10), Expanded(child: FilledButton(onPressed: () => setState(() => showDefault = !showDefault), child: Text(showDefault ? 'Show modified' : 'Show default')))]),
          const SizedBox(height: 20),
          const Text('Why developers adjust them', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 14)),
          const SizedBox(height: 10),
          _why(Icons.swap_horiz_rounded, 'width', 'Match the available horizontal space.'),
          _why(Icons.height_rounded, 'height', 'Control vertical size and consistency.'),
          _why(Icons.crop_rounded, 'fit', 'Choose how the image scales or crops.'),
        ])),
      );

  Widget _header(String n, String name, String value) => Row(children: [Container(width: 29, height: 29, alignment: Alignment.center, decoration: BoxDecoration(color: const Color(0xFF172033), borderRadius: BorderRadius.circular(9)), child: Text(n, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.w800))), const SizedBox(width: 10), Expanded(child: Text(name, style: const TextStyle(fontWeight: FontWeight.w800, fontSize: 15))), Text(value, style: const TextStyle(color: Color(0xFF667085), fontSize: 12, fontWeight: FontWeight.w600))]);

  Widget _why(IconData icon, String title, String text) => Padding(padding: const EdgeInsets.only(bottom: 9), child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Icon(icon, size: 18, color: const Color(0xFF667085)), const SizedBox(width: 9), Expanded(child: RichText(text: TextSpan(style: const TextStyle(color: Color(0xFF667085), fontSize: 12, height: 1.4), children: [TextSpan(text: '$title — ', style: const TextStyle(color: Color(0xFF344054), fontWeight: FontWeight.w800)), TextSpan(text: text)]))]));
}
