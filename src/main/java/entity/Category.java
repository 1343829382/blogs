package entity;

import java.io.Serializable;

public class Category implements Serializable {

    private static final long SerialVersionUID = 1L;

    private Integer id;
    private String typename;
    private Integer orderno;


    public void setId(Integer id) {
        this.id = id;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

    public void setOrderno(Integer orderno) {
        this.orderno = orderno;
    }

    public Integer getId() {
        return id;
    }

    public String getTypename() {
        return typename;
    }

    public Integer getOrderno() {
        return orderno;
    }

    public Category(Integer id, String typename, Integer orderno) {
        this.id = id;
        this.typename = typename;
        this.orderno = orderno;
    }

    @Override
    public String toString() {
        return "Category{" +
                "id=" + id +
                ", typename='" + typename + '\'' +
                ", orderno=" + orderno +
                '}';
    }
}
