import 'package:flutter/material.dart';

class SkinAnalysisScreen extends StatefulWidget {
  const SkinAnalysisScreen({super.key});

  @override
  State<SkinAnalysisScreen> createState() => _SkinAnalysisScreenState();
}

class _SkinAnalysisScreenState extends State<SkinAnalysisScreen> {
  String? _selectedSkinTone;
  String? _selectedFaceShape;
  final Map<String, bool> _skinConcerns = {
    'جوش و آکنه': false,
    'خشکی پوست': false,
    'چربی پوست': false,
    'لکه‌های تیره': false,
    'چین و چروک': false,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF3E0),
      appBar: AppBar(
        title: const Text('آنالیز پوست در آینه'),
        backgroundColor: const Color(0xFFEC407A),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Skin Tone Selection
            _buildSectionTitle('رنگ پوستت رو انتخاب کن:'),
            _buildSkinToneSelection(),

            const SizedBox(height: 24),

            // Face Shape Selection
            _buildSectionTitle('فرم صورتت چطوریه؟'),
            _buildFaceShapeSelection(),

            const SizedBox(height: 24),

            // Skin Concerns
            _buildSectionTitle('نگرانی‌های پوستیت:'),
            _buildSkinConcerns(),

            const SizedBox(height: 32),

            // Analyze Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _analyzeSkin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFEC407A),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'ببین آینه چی می‌گه!',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFF5D4037),
      ),
    );
  }

  Widget _buildSkinToneSelection() {
    const tones = ['روشن', 'گندمی', 'تیره'];
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: tones.map((tone) {
        return ChoiceChip(
          label: Text(tone),
          selected: _selectedSkinTone == tone,
          onSelected: (selected) {
            setState(() {
              _selectedSkinTone = selected ? tone : null;
            });
          },
          selectedColor: const Color(0xFFEC407A),
          labelStyle: TextStyle(
            color: _selectedSkinTone == tone ? Colors.white : const Color(0xFF5D4037),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildFaceShapeSelection() {
    const shapes = ['گرد', 'بیضی', 'مربع', 'قلبی'];
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: shapes.map((shape) {
        return ChoiceChip(
          label: Text(shape),
          selected: _selectedFaceShape == shape,
          onSelected: (selected) {
            setState(() {
              _selectedFaceShape = selected ? shape : null;
            });
          },
          selectedColor: const Color(0xFFEC407A),
          labelStyle: TextStyle(
            color: _selectedFaceShape == shape ? Colors.white : const Color(0xFF5D4037),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildSkinConcerns() {
    return Column(
      children: _skinConcerns.entries.map((entry) {
        return CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(entry.key),
          value: entry.value,
          onChanged: (value) {
            setState(() {
              _skinConcerns[entry.key] = value ?? false;
            });
          },
          activeColor: const Color(0xFFEC407A),
        );
      }).toList(),
    );
  }

  void _analyzeSkin() {
    if (_selectedSkinTone == null || _selectedFaceShape == null) {
      _showErrorDialog('لطفاً اول رنگ پوست و فرم صورتت رو به آینه بگو');
      return;
    }

    final selectedConcerns = _skinConcerns.entries
        .where((entry) => entry.value)
        .map((entry) => entry.key)
        .toList();

    // Show results
    _showResultsDialog(selectedConcerns);
  }

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('یه چیزی رو فراموش کردی'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('باشه، حواسم نبود'),
          ),
        ],
      ),
    );
  }

  void _showResultsDialog(List<String> concerns) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('نتیجه آنالیز آینه'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('• رنگ پوست: $_selectedSkinTone'),
            Text('• فرم صورت: $_selectedFaceShape'),
            if (concerns.isNotEmpty) ...[
              const SizedBox(height: 8),
              Text('• نگرانی‌ها: ${concerns.join("، ")}'),
            ],
            const SizedBox(height: 16),
            const Text(
              '💖 پیشنهاد آینه:\nمحصولات آرایشی متناسب با پوستت و یک روتین مراقبت پوستی اختصاصی',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('ممنون آینه!'),
          ),
        ],
      ),
    );
  }
}
