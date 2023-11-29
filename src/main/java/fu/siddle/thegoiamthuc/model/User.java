package fu.siddle.thegoiamthuc.model;

import java.util.Objects;

public class User {

    private int id;
    private String username;
    private String birth_year;
    private String gender;
    private String email;
    private String hashed_password;
    private String avatar_path;
    private String adress;

    public User() {
    }

    public User(String email, String hashed_password) {
        this.email = email;
        this.hashed_password = hashed_password;
    }

    public User(int id, String username, String birth_year, String gender, String email, String hashed_password, String avatar_path, String adress) {
        this.id = id;
        this.username = username;
        this.birth_year = birth_year;
        this.gender = gender;
        this.email = email;
        this.hashed_password = hashed_password;
        this.avatar_path = avatar_path;
        this.adress = adress;
    }
    
    

    public User(String username, String birth_year, String gender, String email, String hashed_password, String avatar_path, String adress) {
        this.username = username;
        this.birth_year = birth_year;
        this.gender = gender;
        this.email = email;
        this.hashed_password = hashed_password;
        this.avatar_path = avatar_path;
        this.adress = adress;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getBirth_year() {
        return birth_year;
    }

    public void setBirth_year(String birth_year) {
        this.birth_year = birth_year;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getHashed_password() {
        return hashed_password;
    }

    public void setHashed_password(String hashed_password) {
        this.hashed_password = hashed_password;
    }

    public String getAvatar_path() {
        return avatar_path;
    }

    public void setAvatar_path(String avatar_path) {
        this.avatar_path = avatar_path;
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Override
    public String toString() {
        return "User{" + "username=" + username + ", birth_year=" + birth_year + ", gender=" + gender + ", email=" + email + ", hashed_password=" + hashed_password + ", avatar_path=" + avatar_path + ", adress=" + adress + '}';
    }

}
