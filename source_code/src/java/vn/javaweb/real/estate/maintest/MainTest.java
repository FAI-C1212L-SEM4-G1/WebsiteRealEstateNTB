package vn.javaweb.real.estate.maintest;

import vn.javaweb.real.estate.manage.ProfileLandModelManage;

/**
 *
 * @author PhanAnh
 */
public class MainTest {

    public MainTest() {
        /** Test bang gia khu vuc */
//        RegionalPriceTest();
        
        /** Test ho so du an */
        ProfileLandTest();
        
        /** Test account*/
//        AccountTest();
    }
    
    public static void main(String args[]){
        MainTest mainTest = new MainTest();
    }
    
    private void RegionalPriceTest(){
        TestRegionalPrice testRegionalPrice = new TestRegionalPrice();
        /** Them moi bang gia dat */
//        testRegionalPrice.testCreate();
        
        /** Xoa bang gia dat */
//        testRegionalPrice.testDelete();
        
        /** Tim kiem theo ten thanh pho */
//        testRegionalPrice.testFindByCity();
        
        /** Tim kiem tuong doi khu vuc */
//        testRegionalPrice.testFindByRegionalNameLike();
        
        /** Tim tat ca */
        testRegionalPrice.testFindAll();
    }
    
    
    private void ProfileLandTest(){
        TestProfileLand testProfileLand = new TestProfileLand();
        /** Lay tat ca ban ghi */
//        testProfileLand.testFindAll();
        
        /** Tim cac du an da xay dung xong */
//        testProfileLand.testFindByConstructionStatus(ProfileLandModelManage.ConstructionStatus.Completed);
        
        /** Lay tat ca ban ghi */
//        testProfileLand.testFindBetween(3, 10);
        
        /** Tong so ban ghi */
//        testProfileLand.testProfileLandCount();
        
        /** Tim kiem theo ten */
//        testProfileLand.testFindByName("Chung cư 219 Trung Kính");
        
        /** Test tim kiem phia client */
        testProfileLand.testFindConditions("", "", ProfileLandModelManage.ConstructionStatus.Completed);
    }
    
    private void AccountTest(){
        TestAccount testAccount = new TestAccount();
        
        /** Tim kiem account trong khoang */
        testAccount.testFindUserBetween(0, 3);
    }
}
