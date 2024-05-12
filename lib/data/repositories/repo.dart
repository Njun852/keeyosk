abstract class Repo<T> {
  void init();
  void apply();
  void deleteAllFinal();
  List<T> getAllFinal();
  void add(T data);
  void replaceAll(List<T> data);
  List<T> getAll();
  void deleteAll();
  void delete(int index);
  void update(int index, T data);
}
