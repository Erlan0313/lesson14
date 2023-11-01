import 'dart:io';
import 'dart:math';

void main() {
  startGame();
  // compRandomFind();
}

startGame() {
  print('Выберите режим игры: ');
  print('Eсли 1 будет угадывать компьютер ');
  print('Если 2 будете угадывать вы');
  int rejim = int.parse(stdin.readLineSync()!);
  if (rejim == 1) {
    print(
        'Если 1 компьютер найдет с помощью бинарного поиска\nЕсли 2 с помощью рандомного');
    int rejim = int.parse(stdin.readLineSync()!);
    if (rejim == 1) {
      computerBinarySearchFind();
    } else if (rejim == 2) {
      compRandomFind();
    }
  } else if (rejim == 2) {
    userFindRandomComputerNumber();
  } else {
    print('Ошибка неправильный ввод');
    print('Попробуйте еще раз');
    startGame();
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

int userFindRandomComputerNumber() {
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
      print('Вы угадали c $count попытки ваше число $compNumber');
      break;
    }
  }
  return numOfUser;
}

computerBinarySearchFind() {
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
      print('Я угадал с $count попытки. Ваше число: $random');
      break;
    }
  }
}

int compRandomFind() {
  stdout.write('Загадайте число: ');
  int userNum = int.parse(stdin.readLineSync()!);
  String answer = '';
  int min=0;
  int max=100;
  int count = 0;
  while (answer != 'yes') {
    count++;
    int random = min+Random().nextInt(max-min);
    stdout.write('$count Ваше число: $random? ');
    answer = stdin.readLineSync()!;
    if (answer == 'yes') {
      print('Число которое вы загадали: $random');
      print('Вы угадали с $count попытки');
      break;
    }
    else if(answer=="+"){
min =random+1;
    }
    else if(answer=="-"){
      max=random;
    }
  }
  return count;
}
