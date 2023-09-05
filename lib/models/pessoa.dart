class Pessoa {
  String _nome = "";
  double _peso = 0;
  double _altura = 0;
  String _imc = '';

  Pessoa({String nome = '', double peso = 0, double altura = 0}) {
    _nome = nome;
    _peso = peso;
    _altura = altura;
  }

  String getNome() {
    return _nome;
  }

  void setNome(String nome) {
    _nome = nome;
  }

  double getPeso() {
    return _peso;
  }

  void setPeso(double peso) {
    _peso = peso;
  }

  double getAltura() {
    return _altura;
  }

  void setAltura(double altura) {
    _altura = altura;
  }

  String getImc() {
    return _imc;
  }

  void setImc(String imc) {
    _imc = imc;
  }
}
