abstract class BaseResponseMapper<T, V> {
  V mapFromResponse(T data, {Map<dynamic, dynamic>? map});
}
