import 'dart:typed_data';

import 'package:foodieland/models/direction_model/cooking_step_model.dart';
import 'package:http/http.dart' as http;
import 'package:pdf/widgets.dart' as pw;

import '../../models/recipe_model/recipe_model.dart';

class PdfService {
  static final PdfService _instance = PdfService._internal();

  factory PdfService() => _instance;

  PdfService._internal();

  Future<Uint8List> downloadLocalImage(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    } else {
      throw Exception('We can not download the image: ${response.statusCode}');
    }
  }

  Future<Uint8List> buildRecipePdf(RecipeModel recipe) async {
    final titleTextStyle = pw.TextStyle(
      fontSize: 24.0,
      fontWeight: pw.FontWeight.bold,
    );
    final stepsTextStyle = pw.TextStyle(
      fontSize: 12.0,
      fontWeight: pw.FontWeight.bold,
    );
    final pdf = pw.Document();

    // final imageBytes = await downloadLocalImage(recipe.recipeAvatar);
    pdf.addPage(
      pw.Page(
        build: (context) => pw.Column(
          crossAxisAlignment: pw.CrossAxisAlignment.start,
          children: [
            pw.Align(
              alignment: pw.Alignment.center,
              child: pw.Text(recipe.title, style: titleTextStyle),
            ),
            pw.SizedBox(height: 20.0),
            // pw.Image(pw.MemoryImage(imageBytes)),
            pw.Text('Ingredients', style: titleTextStyle.copyWith(fontSize: 16.0)),
            pw.SizedBox(height: 20.0),
            pw.ListView.builder(
              itemBuilder: (_, index) {
                return pw.Align(
                  alignment: pw.Alignment.centerLeft,
                  child: pw.Text(
                    recipe.ingredients[index].text,
                    style: stepsTextStyle,
                  ),
                );
              },
              itemCount: recipe.ingredients.length,
            ),
            pw.SizedBox(height: 20.0),
            pw.Text('Steps', style: titleTextStyle.copyWith(fontSize: 16.0)),
            pw.SizedBox(height: 20.0),
            pw.ListView.builder(
              itemBuilder: (_, index) {
                return recipe.directions[index].type == StepBlockType.image
                    ? pw.SizedBox()
                    : pw.Align(
                        alignment: pw.Alignment.centerLeft,
                        child: pw.Text(
                          recipe.directions[index].content,
                          style: stepsTextStyle,
                        ),
                      );
              },
              itemCount: recipe.directions.length,
            ),
          ],
        ),
      ),
    );
    return pdf.save();
  }
}
