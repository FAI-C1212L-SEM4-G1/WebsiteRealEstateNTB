package vn.javaweb.real.estate.maintest;

import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import vn.javaweb.real.estate.manage.RegionalPriceModelManage;
import vn.javaweb.real.estate.manage.exceptions.RollbackFailureException;
import vn.javaweb.real.estate.model.ConfigConnection;
import vn.javaweb.real.estate.model.RegionalPrice;

/**
 *
 * @author NguyenNgoc
 */
public class TestRegionalPrice {

    public TestRegionalPrice() {
    }
    
    protected void testCreate(){
        try {
            EntityManagerFactory emf = Persistence.createEntityManagerFactory("HousingPU");
            RegionalPriceModelManage manage = new RegionalPriceModelManage(emf);
            RegionalPrice price = new RegionalPrice("CodeTest0000", "Name test 0000", "City test 0000", "Country test 0000");
            manage.create(price);
            System.out.println("Sucsess test..... !");
        } catch (RollbackFailureException ex) {
            System.out.println("Error test exception 1..... !");
            Logger.getLogger(MainTest.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            System.out.println("Error test exception 2..... !");
            Logger.getLogger(MainTest.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    protected boolean testDelete(){
        try {
            ConfigConnection configConnection = ConfigConnection.getInstance();
            configConnection.getRegionalPriceModelManage().deleteByCode("111");
            return true;
        } catch (RollbackFailureException ex) {            
            Logger.getLogger(MainTest.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        } catch (Exception ex) {
            Logger.getLogger(MainTest.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    
    protected void testFindByCity(){
        ConfigConnection configConnection = ConfigConnection.getInstance();
        List<RegionalPrice> list = configConnection.getRegionalPriceModelManage().findByCity("Hà Nội");
        for(RegionalPrice rp : list){
            System.out.println(rp.toString()); 
        }  
        System.out.println("Tong so ket qua: " + list.size());
    }
    
    protected void testFindByRegionalNameLike(){
        ConfigConnection configConnection = ConfigConnection.getInstance();
        List<RegionalPrice> list = configConnection.getRegionalPriceModelManage().findByRegionalNameLike("Hà Đông");
        for(RegionalPrice rp : list){
            System.out.println(rp.toString()); 
        }  
        System.out.println("Tong so ket qua: " + list.size());
    }
}
