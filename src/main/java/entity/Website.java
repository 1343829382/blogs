package entity;

import java.io.Serializable;

public class Website implements Serializable {

    private static final long serialversionUID = 1L;
    private Integer id;
    private String title;
    private String antistop;
    private String relate;
    private Integer qq;
    private String publica;

    public void setId(Integer id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setAntistop(String antistop) {
        this.antistop = antistop;
    }

    public void setRelate(String relate) {
        this.relate = relate;
    }

    public void setQq(Integer qq) {
        this.qq = qq;
    }

    public void setPublica(String publica) {
        this.publica = publica;
    }

    public Integer getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getAntistop() {
        return antistop;
    }

    public String getRelate() {
        return relate;
    }

    public Integer getQq() {
        return qq;
    }

    public String getPublica() {
        return publica;
    }
}
