import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:playlist_app/main.dart';

void main() {
  testWidgets('La pantalla principal muestra el título y la lista de emails', (WidgetTester tester) async {
    // Construye la aplicación y espera que se renderice completamente.
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Verifica que el título "Mock Mail" esté presente en el AppBar.
    expect(find.text('Mock Mail'), findsOneWidget);

    // Verifica que haya al menos un ListTile en la lista (representando los correos electrónicos).
    expect(find.byType(ListTile), findsWidgets);
  });

  testWidgets('El correo electrónico se marca como leído al abrirlo', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Encuentra el primer correo electrónico y tócalo.
    final firstEmail = find.byType(ListTile).first;
    await tester.tap(firstEmail);
    await tester.pumpAndSettle();

    // Verifica que el icono de estado de lectura haya cambiado a leído y su color sea azul.
    final emailIcon = find.descendant(
      of: firstEmail,
      matching: find.byIcon(Icons.mark_email_read),
    );
    expect(emailIcon, findsOneWidget);

    final iconColor = tester.widget<Icon>(emailIcon).color;
    expect(iconColor, Colors.blue);
  });

  testWidgets('El correo electrónico se marca como leído al abrirlo', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Encuentra el primer correo electrónico y tócalo.
    final firstEmail = find.byType(ListTile).first;
    await tester.tap(firstEmail);
    await tester.pumpAndSettle();

    // Verifica que el icono de estado de lectura haya cambiado a leído y su color sea azul.
    final emailIcon = find.descendant(
      of: firstEmail,
      matching: find.byIcon(Icons.mark_email_read),
    );
    expect(emailIcon, findsOneWidget);

    final iconColor = tester.widget<Icon>(emailIcon).color;
    expect(iconColor, Colors.blue);
  });

  testWidgets('El botón de leído/no leído cambia el estado del correo', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    // Encuentra el primer correo electrónico y el botón de leído/no leído.
    final firstEmail = find.byType(ListTile).first;
    final readButton = find.descendant(of: firstEmail, matching: find.byType(IconButton)).first;

    // Toca el botón de leído/no leído.
    await tester.tap(readButton);
    await tester.pumpAndSettle();

    // Verifica que el icono de estado de lectura haya cambiado.
    expect(find.byIcon(Icons.mark_email_read), findsOneWidget);
  });
}