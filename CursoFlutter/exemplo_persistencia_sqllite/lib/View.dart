import 'package:exemplo_persistencia_sqllite/DataBaseController.dart';
import 'package:exemplo_persistencia_sqllite/Model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
   @override
  State<StatefulWidget> createState() => _HomePageState();
  }

class _HomePageState extends State<HomePage>{
  final dbHelper = DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SQLite Demo'),
      ),
      body: FutureBuilder<List<ContactModel>>(
        future: dbHelper.getContacts(), // Obtém a lista de contatos do banco de dados
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Exibe um indicador de carregamento enquanto os dados estão sendo carregados
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}')); // Exibe uma mensagem de erro se ocorrer um erro ao carregar os dados
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No contacts found.')); // Exibe uma mensagem se não houver contatos encontrados
          } else {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                final contact = snapshot.data?[index];
                return ListTile(
                  title: Text(contact!.name),
                  subtitle: Text(contact.email),
                  onTap: () {
                    // Implement onTap functionality
                  },
                );
              },
            ); // Exibe a lista de contatos
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implementando a funcionalidade do botão
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Contato adicionado!')));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}