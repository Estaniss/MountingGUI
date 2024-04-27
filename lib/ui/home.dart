import 'package:flutter/material.dart';

class MountingGui extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.blue,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Text(
            'Exercício Montagem GUI',
            style: TextStyle(
              color: Colors.white, // Set text color to white
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CustomTextField(label: "Nome :", labelText: "Digite o nome"),
              CustomTextField(
                  label: "Endereço :", labelText: "Digite o endereço"),
              CustomTextField(label: "Email :", labelText: "Digite o email"),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FormButtons(
                      name: "Cancelar",
                      title: "Deseja mesmo cancelar?",
                      msg: "Você clicou para cancelar"),
                  FormButtons(
                      name: "Salvar",
                      title: "Deseja mesmo Salvar?",
                      msg: "Você clicou para salvar"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final String labelText;

  CustomTextField({required this.label, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 10.0),
          child: Text(
            label,
            style: TextStyle(fontSize: 20),
          ),
        ),
        Container(
          margin: EdgeInsets.only(bottom: 20.0),
          child: TextFormField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(),
              enabledBorder: OutlineInputBorder(),
              labelText: labelText,
            ),
          ),
        ),
      ],
    );
  }
}

class FormButtons extends StatelessWidget {
  final String name;
  final String title;
  final String msg;

  FormButtons({required this.name, required this.title, required this.msg});

  @override
  Widget build(BuildContext context) {
    var button = Container(
      margin: EdgeInsets.only(top: 50.0, left: 10.0),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0),
          )),
        ),
        child: Text(
          name,
          style: TextStyle(color: Colors.white, fontSize: 15.0),
        ),
        onPressed: () {
          order(context, title, msg, name);
        },
      ),
    );
    return button;
  }

  void order(
      BuildContext context, String title, String content, String buttonText) {
    var alert = AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(buttonText),
        ),
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
