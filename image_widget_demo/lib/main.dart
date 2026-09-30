import 'package:flutter/material.dart';

void main() {
  runApp(const ImageWidgetDemo());
}

class ImageWidgetDemo extends StatelessWidget {
  const ImageWidgetDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Widget Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF1F2937),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F7FA),
      ),
      home: const ImageDemoPage(),
    );
  }
}

class ImageDemoPage extends StatefulWidget {
  const ImageDemoPage({super.key});

  @override
  State<ImageDemoPage> createState() => _ImageDemoPageState();
}

class _ImageDemoPageState extends State<ImageDemoPage> {
  double _width = 190;
  double _height = 190;
  BoxFit _fit = BoxFit.cover;

  void _resetDemo() {
    setState(() {
      _width = 190;
      _height = 190;
      _fit = BoxFit.cover;
    });
  }

  String get _fitName {
    switch (_fit) {
      case BoxFit.cover:
        return 'BoxFit.cover';
      case BoxFit.contain:
        return 'BoxFit.contain';
      case BoxFit.fill:
        return 'BoxFit.fill';
      case BoxFit.fitWidth:
        return 'BoxFit.fitWidth';
      case BoxFit.fitHeight:
        return 'BoxFit.fitHeight';
      case BoxFit.none:
        return 'BoxFit.none';
      case BoxFit.scaleDown:
        return 'BoxFit.scaleDown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flutter Image Widget',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final compact = constraints.maxWidth < 650;

            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1050),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      _buildIntroCard(),
                      const SizedBox(height: 18),
                      compact
                          ? Column(
                              children: [
                                _buildPreviewCard(),
                                const SizedBox(height: 18),
                                _buildControlsCard(),
                              ],
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(child: _buildPreviewCard()),
                                const SizedBox(width: 18),
                                Expanded(child: _buildControlsCard()),
                              ],
                            ),
                      const SizedBox(height: 18),
                      _buildPropertyGuide(),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildIntroCard() {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Real-world use case: Student profile',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'This demo uses Flutter’s Image widget to display a student profile photo. '
              'Use the controls below to see how width, height, and fit change the image.',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.black87,
                    height: 1.45,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPreviewCard() {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Live preview',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              ),
            ),
            const SizedBox(height: 18),
            Container(
              width: double.infinity,
              constraints: const BoxConstraints(minHeight: 360),
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: const Color(0xFFDCE2EA)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 18,
                          offset: Offset(0, 8),
                          color: Color(0x22000000),
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.asset(
                        'assets/student_profile.png',
                        width: _width,
                        height: _height,
                        fit: _fit,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  const Text(
                    'Martin De Poles',
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    'Software Engineering Student',
                    style: TextStyle(color: Colors.black54),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'African Leadership University',
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildControlsCard() {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Change the three properties',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 18),
            _buildSlider(
              title: 'width',
              value: _width,
              min: 100,
              max: 300,
              onChanged: (value) => setState(() => _width = value),
            ),
            _buildSlider(
              title: 'height',
              value: _height,
              min: 100,
              max: 300,
              onChanged: (value) => setState(() => _height = value),
            ),
            const SizedBox(height: 6),
            Text(
              'fit',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 8),
            DropdownButtonFormField<BoxFit>(
              initialValue: _fit,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 12,
                ),
              ),
              items: const [
                DropdownMenuItem(
                  value: BoxFit.cover,
                  child: Text('BoxFit.cover'),
                ),
                DropdownMenuItem(
                  value: BoxFit.contain,
                  child: Text('BoxFit.contain'),
                ),
                DropdownMenuItem(
                  value: BoxFit.fill,
                  child: Text('BoxFit.fill'),
                ),
                DropdownMenuItem(
                  value: BoxFit.fitWidth,
                  child: Text('BoxFit.fitWidth'),
                ),
                DropdownMenuItem(
                  value: BoxFit.fitHeight,
                  child: Text('BoxFit.fitHeight'),
                ),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() => _fit = value);
                }
              },
            ),
            const SizedBox(height: 18),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                'Current values\n'
                'width: ${_width.round()} px\n'
                'height: ${_height.round()} px\n'
                'fit: $_fitName',
                style: const TextStyle(
                  height: 1.55,
                  fontFamily: 'monospace',
                ),
              ),
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: _resetDemo,
                icon: const Icon(Icons.refresh),
                label: const Text('Reset demo'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSlider({
    required String title,
    required double value,
    required double min,
    required double max,
    required ValueChanged<double> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            Text('${value.round()} px'),
          ],
        ),
        Slider(
          value: value,
          min: min,
          max: max,
          divisions: 20,
          label: '${value.round()} px',
          onChanged: onChanged,
        ),
      ],
    );
  }

  Widget _buildPropertyGuide() {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'What each property changes',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 14),
            _propertyRow(
              '1',
              'width',
              'Controls the image width in logical pixels. Developers adjust it to fit the horizontal space available.',
            ),
            _propertyRow(
              '2',
              'height',
              'Controls the image height in logical pixels. Developers adjust it to create a consistent vertical layout.',
            ),
            _propertyRow(
              '3',
              'fit',
              'Controls how the image is inscribed into its allocated space. For example, cover fills the box while contain keeps the whole image visible.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _propertyRow(String number, String name, String explanation) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 13),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 13,
            child: Text(
              number,
              style: const TextStyle(fontSize: 12),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  color: Colors.black87,
                  height: 1.4,
                  fontSize: 15,
                ),
                children: [
                  TextSpan(
                    text: '$name — ',
                    style: const TextStyle(fontWeight: FontWeight.w800),
                  ),
                  TextSpan(text: explanation),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
