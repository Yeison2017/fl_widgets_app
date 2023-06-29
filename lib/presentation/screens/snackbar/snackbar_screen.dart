import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {
  static const name = 'snackbar_screen';
  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackback = SnackBar(
      content: const Text('Hola Mundo'),
      action: SnackBarAction(label: 'Ok!', onPressed: () {}),
      duration: const Duration(seconds: 2),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackback);
  }

  void openDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: const Text('¿Estás seguro?'),
              content: const Text(
                  "Veniam nulla consectetur occaecat non commodo aliqua quis qui labore. Eiusmod nostrud proident laborum reprehenderit id aliqua ad adipisicing occaecat consectetur labore pariatur. Veniam cillum duis anim nostrud ullamco fugiat elit ipsum. Id ad laborum quis laborum magna consequat laboris sunt sunt et tempor culpa. Quis sunt enim veniam elit do laborum est ipsum anim sunt cillum pariatur. Deserunt voluptate nulla occaecat cupidatat elit ex ad. Irure officia excepteur ut est incididunt consequat cillum ea dolore eu laborum cillum anim in."),
              actions: [
                TextButton(
                    onPressed: () => context.pop(),
                    child: const Text('Cancelar')),
                FilledButton(
                    onPressed: () => context.pop(),
                    child: const Text('Aceptar'))
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars y Diálogos'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () {
                showAboutDialog(context: context, children: [
                  const Text(
                      "Dolore id ea elit aliqua ad. Excepteur duis deserunt ipsum ipsum dolore reprehenderit eu do laborum. Labore laboris incididunt ipsum consectetur excepteur occaecat. Nostrud incididunt amet velit cillum. Sunt ex reprehenderit nulla labore amet id. Mollit in dolor fugiat incididunt officia magna dolore sint occaecat fugiat nulla aliquip aliquip.")
                ]);
              },
              child: const Text('Licencias usadas'),
            ),
            FilledButton.tonal(
              onPressed: () {
                openDialog(context);
              },
              child: const Text('Mostrar diálogo'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        onPressed: () => showCustomSnackbar(context),
      ),
    );
  }
}
