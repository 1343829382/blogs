package entity;

public class Admin {
    private Integer id;
    private String username;
    private String password;
    private String name;
    private String img;
    private String motto;

    public void setId(Integer id) {
        this.id = id;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public void setMotto(String motto) {
        this.motto = motto;
    }

    public Integer getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public String getPassword() {
        return password;
    }

    public String getName() {
        return name;
    }

    public String getImg() {
        return img;
    }

    public String getMotto() {
        return motto;
    }
}
