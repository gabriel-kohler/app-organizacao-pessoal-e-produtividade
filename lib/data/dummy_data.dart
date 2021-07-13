import 'package:prac/models/category.dart';
import 'package:prac/models/task.dart';

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

final DUMMY_CATEGORIES = [
  Category(categoryId: 'c1', title: 'Geral'),
  Category(categoryId: 'c2', title: 'Programação'),
  Category(categoryId: 'c3', title: 'Estudos'),
];
