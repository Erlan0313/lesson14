import 'dart:io';
import 'dart:math';

void main() {
  startGame();
}

startGame() {
  print('Выберите режим игры: ');
  print('если computer будет угадывать компьютер ');
  print('Если i');
  String rejim = stdin.readLineSync()!;
  if (rejim == 'computer') {
    task1();
  } else if (rejim == 'i') {
    randomSearch();
  } else {
    print('Ошибка неправильный ввод');
  }
}
// Нужно добавить вариант игры наоборот: компьютер загадывает случайное число
//  от 1 до 100, а пользователь должен отгадать.
// Компьютер выводит сообщения:
// greater, если число больше догадки
// less, если число меньше догадки
// yes, если пользователь угадал
// Указания:
// В начале игры пользователь попадает в меню, где может выбрать режим игры.

int randomSearch() {
  print('Я загадал число от 1 до 100');
  int min = 1;
  int max = 100;
  int count = 0;
  int compNumber = Random().nextInt(max - min) + min;
  int numOfUser = 0;
  while (compNumber != numOfUser) {
    count++;
    stdout.write(' Мое $count-oe число: ');
    numOfUser = int.parse(stdin.readLineSync()!);
    if (numOfUser < compNumber) {
      print('Больше: ');
    } else if (numOfUser > compNumber) {
      print('Меньше: ');
    }
    if (numOfUser == compNumber) {
      print('Вы угадали ваше число $compNumber');
      break;
    }
  }
  return numOfUser;
}

task1() {
  stdout.write('Загадайте число: ');
  int userNum = int.parse(stdin.readLineSync()!);
  String answer = '';
  int count = 0;
  int max = 100;
  int min = 0;
  while (answer != 'yes') {
    count++;
    int random = min + Random().nextInt(max - min);
    stdout.write('$count Ваше число: $random? ');
    answer = stdin.readLineSync()!;
    if (answer == '+') {
      min = random + 1;
    } else {
      max = random;
    }
    if (answer == 'yes') {
      print('Ваше число: $random');
      break;
    }
  }
}
