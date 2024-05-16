abstract class Repo<T> {
  void init();
  void deleteAll();
  List<T> getAll();
  void add(T data);
  void replaceAll(List<T> data);
  void delete(String id);
  void update(String id, T data);
}
