/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package treinadoresEtratadores;

import com.sun.xml.wss.saml.AnyType;

/**
 *
 * @author matheus
 */
public class Usuario {
    private boolean tratador=false;
    private int ID;
    private String login, nome, email, endereco, telefone;
    private String Esp;
    
    public Usuario(int ID,String login,String nome,String email,String endereco,String telefone,boolean tratador){
        this.ID=ID;
        this.login=login;
        this.nome=nome;
        this.email=email;
        this.endereco=endereco;
        this.telefone=telefone;
        this.tratador=tratador;
    }
    public boolean getTratador(){
        return tratador;
    }
    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEndereco() {
        return endereco;
    }

    public void setEndereco(String endereco) {
        this.endereco = endereco;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }
    
}
