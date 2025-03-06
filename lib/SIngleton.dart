// Es una clase de BD local que se almacena en cache
// Acceso global desde cualquier vista a la informacion almacenada
class Singleton{
  // Instancear variable global
  static Singleton? _instance; // Indica que la variable puede ser null

  Singleton._internal(){
    _instance = this;
  }

  // Verificar si singleton es = null, si asi se crea una nueva instancia y si no devuelve la instancia de cache
  factory Singleton() => _instance ?? Singleton._internal();

  // Siempre inicalizar las variables en algo fijo
  String name = '';

}