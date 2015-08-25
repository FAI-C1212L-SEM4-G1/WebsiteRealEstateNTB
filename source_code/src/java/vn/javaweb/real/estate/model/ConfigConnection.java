package vn.javaweb.real.estate.model;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import vn.javaweb.real.estate.manage.PaymentModeModelManage;
import vn.javaweb.real.estate.manage.ProfileLandModelManage;
import vn.javaweb.real.estate.manage.RegionalPriceModelManage;

/**
 * @dateCreate 25/08/2015
 * @authorBy PhanAnh
 */
public class ConfigConnection {
    
    private static ConfigConnection instance;
    private final RegionalPriceModelManage regionalPriceModelManage;
    private final ProfileLandModelManage profileLandModelManage;
    private final PaymentModeModelManage paymentModeModelManage;
    public static String PERSISTENCE_UNIT_NAME = "HousingPU";

    public ConfigConnection() {
        EntityManagerFactory emf = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
        profileLandModelManage = new ProfileLandModelManage(emf);
        regionalPriceModelManage = new RegionalPriceModelManage(emf);
        paymentModeModelManage = new PaymentModeModelManage(emf);
    }
    
    public static ConfigConnection getInstance(){
        if(instance == null)
            instance = new ConfigConnection();
        return instance;
    }
    
    public ProfileLandModelManage getProfileLandModelManage(){
        return profileLandModelManage;
    }

    public RegionalPriceModelManage getRegionalPriceModelManage() {
        return regionalPriceModelManage;
    }

    public PaymentModeModelManage getPaymentModeModelManage() {
        return paymentModeModelManage;
    }
    
}
