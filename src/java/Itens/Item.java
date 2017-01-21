/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Itens;

/**
 *
 * @author USER
 */
public class Item {
    private int ID;
    private String description, nome, imgPath;
    public Item(int ID,String description,String nome,String imgPath){
        this.ID= ID;
        this.description= description;
        this.nome= nome;
        this.imgPath= imgPath;
    }
    
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }
}
