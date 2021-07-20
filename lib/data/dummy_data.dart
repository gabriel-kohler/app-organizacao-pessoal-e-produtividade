import 'dart:math';
import 'package:prac/models/category.dart';
import 'package:prac/models/note_quill.dart';
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

// NOTES

final DUMMY_NOTES = [
  NoteQuill(
    id: Random().nextDouble().toString(),
    titleNote: 'Anotações Gerais',
    note: [{"insert":"ANOTAÇAO1 ANOTAÇAO1 ","attributes":{"bold":true}},{"insert":"ANOTAÇAO1 ANOTA","attributes":{"italic":true}},{"insert":"ÇAO1\n"},{"insert":"ANOTACAO1 ANOTAÇAO1 ","attributes":{"underline":true}},{"insert":"TESTE "},{"insert":"TESTE ","attributes":{"color":"#ef9a9a"}},{"insert":"TESTE","attributes":{"color":"#000000","background":"#ef9a9a"}},{"insert":"\n"}],
  ),
  NoteQuill(
    id: Random().nextDouble().toString(),
    titleNote: 'Objetivos',
    note: [{"insert":"ANOTACAO 2"},{"insert":"\n","attributes":{"header":1}},{"insert":"testando\ntestando"},{"insert":"\n","attributes":{"list":"ordered"}},{"insert":"novoteste"},{"insert":"\n","attributes":{"list":"ordered"}},{"insert":"novoteste"},{"insert":"\n","attributes":{"list":"ordered"}},{"insert":"novoteste"},{"insert":"\n","attributes":{"list":"ordered"}},{"insert":"\n"}],
  ),
  NoteQuill(
    id: Random().nextDouble().toString(),
    titleNote: 'Aprendizados',
    note: [{"insert":"LISTA"},{"insert":"\n","attributes":{"header":1}},{"insert":"item 1"},{"insert":"\n","attributes":{"list":"bullet"}},{"insert":"item 2"},{"insert":"\n","attributes":{"list":"bullet"}},{"insert":"item 3"},{"insert":"\n","attributes":{"list":"bullet"}},{"insert":"item 4"},{"insert":"\n","attributes":{"list":"bullet"}},{"insert":"\n"},{"insert":"LISTA TESTE","attributes":{"bold":true}},{"insert":"\n\n"}],
  ),
  NoteQuill(
    id: Random().nextDouble().toString(),
    titleNote: 'Ideias',
    note: [{"insert":"ANOTACOES"},{"insert":"\n","attributes":{"header":1}},{"insert":"\nteste"},{"insert":"\n","attributes":{"code-block":true}},{"insert":"\nlink:\n"},{"insert":"www.google.com","attributes":{"link":"www.google.com"}},{"insert":"\n"}],
  ),
  NoteQuill(
    id: Random().nextDouble().toString(),
    titleNote: 'Apps',
    note: [{"insert":"ANOTACOES"},{"insert":"\n","attributes":{"header":1}},{"insert":"\nteste"},{"insert":"\n","attributes":{"code-block":true}},{"insert":"\nlink:\n"},{"insert":"www.google.com","attributes":{"link":"www.google.com"}},{"insert":"\n"}],
  ),
  NoteQuill(
    id: Random().nextDouble().toString(),
    titleNote: 'Oq fazer',
    note: [{"insert":"ANOTACOES"},{"insert":"\n","attributes":{"header":1}},{"insert":"\nteste"},{"insert":"\n","attributes":{"code-block":true}},{"insert":"\nlink:\n"},{"insert":"www.google.com","attributes":{"link":"www.google.com"}},{"insert":"\n"}],
  ),
  NoteQuill(
    id: Random().nextDouble().toString(),
    titleNote: 'Programação',
    note: [{"insert":"ANOTACOES"},{"insert":"\n","attributes":{"header":1}},{"insert":"\nteste"},{"insert":"\n","attributes":{"code-block":true}},{"insert":"\nlink:\n"},{"insert":"www.google.com","attributes":{"link":"www.google.com"}},{"insert":"\n"}],
  ),
  NoteQuill(
    id: Random().nextDouble().toString(),
    titleNote: 'Livros para ler',
    note: [{"insert":"ANOTACOES"},{"insert":"\n","attributes":{"header":1}},{"insert":"\nteste"},{"insert":"\n","attributes":{"code-block":true}},{"insert":"\nlink:\n"},{"insert":"www.google.com","attributes":{"link":"www.google.com"}},{"insert":"\n"}],
  ),
  NoteQuill(
    id: Random().nextDouble().toString(),
    titleNote: 'Projeto App Tasks',
    note: [{"insert":"ANOTACOES"},{"insert":"\n","attributes":{"header":1}},{"insert":"\nteste"},{"insert":"\n","attributes":{"code-block":true}},{"insert":"\nlink:\n"},{"insert":"www.google.com","attributes":{"link":"www.google.com"}},{"insert":"\n"}], 
  ),
  NoteQuill(
    id: Random().nextDouble().toString(),
    titleNote: 'Bugs App Tasks',
    note: [{"insert":"ANOTACOES"},{"insert":"\n","attributes":{"header":1}},{"insert":"\nteste"},{"insert":"\n","attributes":{"code-block":true}},{"insert":"\nlink:\n"},{"insert":"www.google.com","attributes":{"link":"www.google.com"}},{"insert":"\n"}],
  ),
  NoteQuill(
    id: Random().nextDouble().toString(),
    titleNote: 'Anotação',
    note: [{"insert":"ANOTACOES"},{"insert":"\n","attributes":{"header":1}},{"insert":"\nteste"},{"insert":"\n","attributes":{"code-block":true}},{"insert":"\nlink:\n"},{"insert":"www.google.com","attributes":{"link":"www.google.com"}},{"insert":"\n"}],
  ),
];
