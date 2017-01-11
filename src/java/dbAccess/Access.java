package dbAccess;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;

public class Access {
    public StringBuilder SelectSQL(String Select,int isString) throws SQLException,InstantiationException, IllegalAccessException {
            Connection connection = null;
            Statement statement = null;
            ResultSet rs = null;
            List novo = new ArrayList();
            try{
            Class.forName("org.sqlite.JDBC").newInstance();
            } catch (ClassNotFoundException e) {
            //Cannot register postgresql MySQL driver
            System.out.println("This is something you have not add in postgresql library to classpath!");
            e.printStackTrace();
            } 
            
            connection = DriverManager.getConnection("jdbc:sqlite:E:\\Doc\\Desktop\\Projects\\PKMN\\pokeBD.db");
            statement = connection.createStatement();
            rs = statement.executeQuery(Select);
            int length = rs.getMetaData().getColumnCount();
            StringBuilder vetor = new StringBuilder();
            if(length>0)
            while (rs.next()) {
                if(length>1)
                    vetor.append('[');
                for(int i = 1;i<=length;i++){
                    if(isString == 1)
                        vetor.append("\"");
                    vetor.append(rs.getString(i));
                    if(isString == 1)
                        vetor.append("\"");
                    
                    vetor.append(',');
                }
                if(length>1){
                    vetor.setCharAt(vetor.length()-1, ']');
                    vetor.append(',');
                }
                vetor.setCharAt(vetor.length()-1, ',');
            }  
            /*if(length>1){
                vetor.setCharAt(vetor.length()-1, ']');
            }else
                vetor.setCharAt(vetor.length()-1, ' ');*/
            novo.add(vetor); 
            vetor = new StringBuilder();
            rs.close();
            statement.close();
            connection.close();
         return sqlStringToVector(novo);
        }
    
    private StringBuilder sqlStringToVector(List<String> Lista){
        StringBuilder sb = new StringBuilder();
        //sb.append('[');
        sb.append(Lista);
        //sb.setCharAt(sb.length()-1, ' ');
        for(int i=0;i<sb.length();i++){
            if(i > 1 && sb.charAt(i) == ' ' &&  (sb.charAt(i-1) == '\"' || sb.charAt(i-1) == ']' )){
                sb.setCharAt(i, ',');
            }else if(sb.charAt(i) == '(')
                sb.setCharAt(i, '[');
            else if (sb.charAt(i) == ')'){
                sb.setCharAt(i, ']');
                if(sb.charAt(i+1) == ')')
                    if(i+3 < sb.length()-1 && sb.charAt(i+3) != ','){
                        if(sb.charAt(i+3) == '[')
                        sb.setCharAt(i+2, ']');
                        sb.setCharAt(i+2, ',');
                    }
                    
            }
            
        }
        if(sb.charAt(sb.length()-1) == ','){
            sb.delete(sb.length()-1,1);
        }
        return sb;
    }
    
}
