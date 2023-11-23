package fu.siddle.thegoiamthuc.model.dao;

import java.util.*;

public interface DAO<T> {

    public List<T> getAll();

    public void insert(T obj);
}
