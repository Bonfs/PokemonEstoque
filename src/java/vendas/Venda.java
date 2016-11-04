/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vendas;

import treinadoresEtratadores.Pokemon;
import java.util.ArrayList;
import java.util.Date;

/**
 *
 * @author matheus
 */
public class Venda {
    private Date dataDeVenda;
    private int codTreinador;
    ArrayList<VendaProduto> vendaProduto;
    
    public Venda(){
        this.vendaProduto = new ArrayList();
    }
}
