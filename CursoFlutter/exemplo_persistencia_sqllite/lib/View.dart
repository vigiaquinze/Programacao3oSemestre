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
        title: Text('Lista de Contatos'),
      ),
      body: FutureBuilder<List<ContactModel>>(
        future: dbHelper.getContacts(), // Obtém a lista de contatos do banco de dados
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Exibe um indicador de carregamento enquanto os dados estão sendo carregados
          } else if (snapshot.hasError) {
            return Center(child: Text('Erro: ${snapshot.error}')); // Exibe uma mensagem de erro se ocorrer um erro ao carregar os dados
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Sem contatos adicionados.')); // Exibe uma mensagem se não houver contatos encontrados
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
          _adicionaContato(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
  void _adicionaContato(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController addressController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Adicionar contato"),
          content: Column(
            children: [
          // Campo de texto
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Insira seu nome',
              ),
            ),
          ),
          // Campo de texto
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Insira seu e-mail',
              ),
            ),
          ),
          // Campo de texto
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: phoneController,
              decoration: InputDecoration(
                labelText: 'Insira seu telefone',
              ),
            ),
          ),
          // Campo de texto
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: addressController,
              decoration: InputDecoration(
                labelText: 'Insira seu endereço',
                // Ícone para adicionar tarefa ao pressionar o botão
                suffixIcon: IconButton(
                  onPressed: () async {
                    ContactModel novoContato = new ContactModel(
                      name: nameController.text,
                      email: emailController.text,
                      phone: phoneController.text,
                      addressLine1: addressController.text
                      )
                    ;
                    await dbHelper.create(novoContato);
                    Navigator.of(context).pop();
                    // Limpar o campo de texto após adicionar a tarefa
                    nameController.clear();
                    phoneController.clear();
                    emailController.clear();
                    addressController.clear();
                    setState(() {});
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
          )
          ],
          ),
        );
      });
  }
}