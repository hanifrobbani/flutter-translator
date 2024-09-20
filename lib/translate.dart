import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class TranslatePage extends StatefulWidget {
  @override
  _TranslatePageState createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
  String translated = 'Translation';
  final TextEditingController _textController = TextEditingController();
  String? _selectedBahasa;
  String? _selectedBahasa2;
  String _fromCode = '';
  String _toCode = '';
  final GoogleTranslator _translator = GoogleTranslator();

  final List<String> bahasa = [
    'English',
    'Indonesia',
    'France',
    'Germany',
    'Malaysia',
    'Spanyol'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.translate),
        title: Text('Translation'),
      ),
      body: Card(
        margin: EdgeInsets.all(12),
        child: ListView(
          padding: EdgeInsets.all(12),
          children: [
            Row(
              children: [
                Expanded(child: Text('Dari Bahasa: ')),
                Expanded(
                  child: DropdownButton<String>(
                    value: _selectedBahasa,
                    items: bahasa.map((String item) {
                      return DropdownMenuItem(
                        child: Text(item),
                        value: item,
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedBahasa = value;
                        switch (value) {
                          case 'English':
                            _fromCode = 'en';
                            break;
                          case 'Indonesia':
                            _fromCode = 'id';
                            break;
                          case 'France':
                            _fromCode = 'fr';
                            break;
                          case 'Germany':
                            _fromCode = 'de';
                            break;
                          case 'Spanyol':
                            _fromCode = 'es';
                            break;
                          case 'Malaysia':
                            _fromCode = 'ms';
                            break;
                        }
                      });
                    },
                  ),
                ),
                Expanded(child: Text('Ke Bahasa: ')),
                Expanded(
                  child: DropdownButton<String>(
                    value: _selectedBahasa2,
                    items: bahasa.map((String item) {
                      return DropdownMenuItem(
                        child: Text(item),
                        value: item,
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedBahasa2 = value;
                        switch (value) {
                          case 'English':
                            _toCode = 'en';
                            break;
                          case 'Indonesia':
                            _toCode = 'id';
                            break;
                          case 'France':
                            _toCode = 'fr';
                            break;
                          case 'Germany':
                            _toCode = 'de';
                            break;
                          case 'Spanyol':
                            _toCode = 'es';
                            break;
                          case 'Malaysia':
                            _toCode = 'ms';
                            break;
                        }
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            TextField(
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              decoration: InputDecoration(hintText: 'Enter Text'),
              controller: _textController,
            ),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () async {
                try {
                  final translation = await _translator.translate(
                    _textController.text,
                    from: _fromCode,
                    to: _toCode,
                  );
                  setState(() {
                    translated = translation.text;
                  });
                } catch (error) {
                  print('Translation error: $error');
                  setState(() {
                    translated = 'Error occurred during translation';
                  });
                }
              },
              child: Text('Submit'),
            ),
            SizedBox(height: 16),
            Text(
              translated,
              style: TextStyle(
                fontSize: 24,
                color: Colors.lightBlueAccent,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
