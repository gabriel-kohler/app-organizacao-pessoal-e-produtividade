import 'dart:math';

import 'package:prac/models/category.dart';
import 'package:prac/models/note.dart';
import 'package:prac/models/task.dart';

//CATEGORIES

final DUMMY_CATEGORIES = [
  Category(categoryId: 'c1', title: 'Geral'),
  Category(categoryId: 'c2', title: 'Programação'),
  Category(categoryId: 'c3', title: 'Estudos'),
];

//TASKS

final DUMMY_TASKS = [
  Task(
    idTask: '01',
    idCategory: 'c1',
    titleTask: 'Concluir o trabalho da faculdade.',
  ),
  Task(
    idTask: '02',
    idCategory: 'c1',
    titleTask: 'Levar meu cachorro para passear.',
  ),
  Task(
    idTask: '03',
    idCategory: 'c1',
    titleTask: 'Organizar planilhas.',
  ),
  Task(
    idTask: '04',
    idCategory: 'c2',
    titleTask: 'Repassar código para projeto principal.',
  ),
  Task(
    idTask: '05',
    idCategory: 'c2',
    titleTask: 'Revisar e melhorar código.',
  ),
  Task(
    idTask: '06',
    idCategory: 'c2',
    titleTask: 'Versionar projeto.',
  ),
  Task(
    idTask: '07',
    idCategory: 'c2',
    titleTask: 'Funcionalidade de adicionar nova categoria.',
  ),
  Task(
    idTask: '08',
    idCategory: 'c2',
    titleTask: 'Adicionar task em categoria.',
  ),
  Task(
    idTask: '09',
    idCategory: 'c2',
    titleTask: 'Resolver bug de deletar task.',
  ),
  Task(
    idTask: '10',
    idCategory: 'c3',
    titleTask: 'Estudar sobre versionamento GIT.',
  ),
  Task(
    idTask: '11',
    idCategory: 'c3',
    titleTask: 'Estudar sobre programação orientada a objetos.',
  ),
  Task(
    idTask: '12',
    idCategory: 'c3',
    titleTask: 'Estudar sobre gerenciamento de estado com MOBX.',
  ),
];

//NOTES

final DUMMY_NOTES = [
  Note(
    noteId: Random().nextDouble().toString(),
    titleNote: 'Anotações Gerais',
    noteContent:
        ' is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
  ),
  Note(
    noteId: Random().nextDouble().toString(),
    titleNote: 'Objetivos',
    noteContent:
        ' is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
  ),
  Note(
    noteId: Random().nextDouble().toString(),
    titleNote: 'Aprendizados',
    noteContent:
        ' is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
  ),
  Note(
    noteId: Random().nextDouble().toString(),
    titleNote: 'Ideias',
    noteContent:
        ' is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
  ),
  Note(
    noteId: Random().nextDouble().toString(),
    titleNote: 'Apps',
    noteContent:
        ' is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
  ),
  Note(
    noteId: Random().nextDouble().toString(),
    titleNote: 'Oq fazer',
    noteContent:
        ' is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
  ),
  Note(
    noteId: Random().nextDouble().toString(),
    titleNote: 'Programação',
    noteContent:
        ' is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
  ),
  Note(
    noteId: Random().nextDouble().toString(),
    titleNote: 'Livros para ler',
    noteContent:
        ' is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
  ),
  Note(
    noteId: Random().nextDouble().toString(),
    titleNote: 'Projeto App Tasks',
    noteContent:
        ' is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
  ),
  Note(
    noteId: Random().nextDouble().toString(),
    titleNote: 'Bugs App Tasks',
    noteContent:
        ' is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
  ),
  Note(
    noteId: Random().nextDouble().toString(),
    titleNote: 'Anotação',
    noteContent:
        ' is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
  ),
];