abstract class Repo<T> {
  Future<List<T>> init();
  void deleteAll();
  List<T> getAll();
  T get(String id);
  void add(T data);
  void replaceAll(List<T> data);
  void delete(String id);
  void update(String id, T data);
}
