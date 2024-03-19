package app.entities.c3;

public class Instructions {

    private String name;
    private String description;


    public Instructions(String name, String description) {
        this.name = name;
        this.description = description;
    }

    public Instructions() {
    }

    public String getName() {
        return name;
    }

    public String getDescription() {
        return description;
    }



}
