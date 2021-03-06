package vn.javaweb.real.estate.maintest;

import java.util.List;
import vn.javaweb.real.estate.manage.ProfileLandModelManage;
import vn.javaweb.real.estate.model.ConfigConnection;
import vn.javaweb.real.estate.model.ProfileLand;

/**
 *
 * @author PhanAnh
 */
public class TestProfileLand {

    public TestProfileLand() {
    }
    
    protected void testFindAll(){
        ConfigConnection configConnection = ConfigConnection.getInstance();
        List<ProfileLand> list = configConnection.getProfileLandModelManage().findAll();
        for(ProfileLand pl : list){
            System.out.println(pl.toString()); 
        }  
        System.out.println("Tong so ket qua: " + list.size());
    }
    
    protected void testProfileLandCount(){
        ConfigConnection configConnection = ConfigConnection.getInstance();
        int number = configConnection.getProfileLandModelManage().getProfileLandCount();        
        System.out.println("Ket qua tong so ban ghi trong bang: " + number);
    }
    
    protected void testFindByConstructionStatus(ProfileLandModelManage.ConstructionStatus constructionStatus){
        ConfigConnection configConnection = ConfigConnection.getInstance();
        List<ProfileLand> list = configConnection.getProfileLandModelManage().findByConstructionStatus(constructionStatus);
        for(ProfileLand pl : list){
            System.out.println(pl.toString() + " -- dateStart: " + pl.getDateStart() + " -- dateEnd: " + pl.getDateEnd()); 
        }  
        System.out.println("Tong so ket qua: " + list.size());
    }
    
    protected void testFindByName(String name){
        ConfigConnection configConnection = ConfigConnection.getInstance();
        List<ProfileLand> list = configConnection.getProfileLandModelManage().findByName(name);
        for(ProfileLand pl : list){
            System.out.println(pl.toString()); 
        }  
        System.out.println("Tong so ket qua: " + list.size());
    }
    
    protected void testFindBetween(int indexStart, int indexEnd){
        ConfigConnection configConnection = ConfigConnection.getInstance();
        List<ProfileLand> list = configConnection.getProfileLandModelManage().findBetween(indexStart, indexEnd);
        for(ProfileLand pl : list){
            System.out.println(pl.toString()); 
        }  
        System.out.println("Tong so ket qua: " + list.size());
    }
    
    protected void testFindConditions(String name, String codeRegional, ProfileLandModelManage.ConstructionStatus constructionStatus){
        ConfigConnection configConnection = ConfigConnection.getInstance();
        List<ProfileLand> list = configConnection.getProfileLandModelManage().findConditions(name, codeRegional, constructionStatus);
        for(ProfileLand pl : list){
            System.out.println(pl.toString()); 
        }  
        System.out.println("Tong so ket qua: " + list.size());
    }
}
