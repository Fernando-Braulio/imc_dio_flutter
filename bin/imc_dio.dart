import 'dart:convert';
import 'dart:io';

import 'package:imc_dio/models/Pessoa.dart';

void main(List<String> arguments) {
  print("Bem vindo ao sistema de IMC!");
  Pessoa pessoa = Pessoa();
  pessoa.setNome(repeticaoDigitarValValido("Favor digite o seu nome: "));

  var strAltura =
      repeticaoDigitarValValido("Por gentileza nos informe a Altura: ");
  try {
    double altura = double.parse(strAltura);
    pessoa.setAltura(altura);
  } catch (e) {
    msgError();
    return;
  }

  var strPeso = repeticaoDigitarValValido("Por gentileza nos informe o Peso: ");
  try {
    double peso = double.parse(strPeso);
    pessoa.setPeso(peso);
  } catch (e) {
    msgError();
    return;
  }

  double imc = calculaImc(pessoa.getAltura(), pessoa.getPeso());
  pessoa.setImc(imc.toStringAsPrecision(3));

  switch (imc) {
    case < 16:
      printMsgFinal(pessoa.getNome(), pessoa.getImc(), "Muito abaixo do peso");
      break;
    case >= 16 && < 17:
      printMsgFinal(pessoa.getNome(), pessoa.getImc(), "Magreza moderada");
      break;
    case >= 17 && < 18.5:
      printMsgFinal(pessoa.getNome(), pessoa.getImc(), "Magreza leve");
      break;
    case >= 18.5 && < 25:
      printMsgFinal(pessoa.getNome(), pessoa.getImc(), "Saudável");
      break;
    case >= 25 && < 30:
      printMsgFinal(pessoa.getNome(), pessoa.getImc(), "Sobrepeso");
      break;
    case >= 30 && < 35:
      printMsgFinal(pessoa.getNome(), pessoa.getImc(), "Obesidade Grau I");
      break;
    case >= 35 && < 40:
      printMsgFinal(
          pessoa.getNome(), pessoa.getImc(), "Obesidade Grau II (severa)");
      break;
    case >= 40:
      printMsgFinal(
          pessoa.getNome(), pessoa.getImc(), "Obesidade Grau III (mórbida)");
      break;
    default:
  }
}

double calculaImc(double altura, double peso) {
  altura = altura / 100;
  double imc = peso / (altura * altura);
  return imc;
}

void printMsgFinal(String nome, String imc, String texto) {
  print(
      "$nome seu índice de massa corporal (IMC) está com $imc, isso significa que você está $texto.");
}

String repeticaoDigitarValValido(String texto) {
  String? retorno;

  do {
    print(texto);
    retorno = stdin.readLineSync(encoding: utf8);
  } while (retorno == null || retorno == '');

  return retorno;
}

void msgError(
    {String? msgError =
        "Desculpe não foi possível converter o valor enviado, favor tente novamente mais tarde :)"}) {
  print(msgError);
}
