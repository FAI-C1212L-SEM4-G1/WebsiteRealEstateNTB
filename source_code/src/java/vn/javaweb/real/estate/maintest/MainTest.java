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
    }
    
    public static void main(String args[]){
        MainTest mainTest = new MainTest();
    }
    
    private void RegionalPriceTest(){
        TestRegionalPrice testRegionalPrice = new TestRegionalPrice();
        /** Khoi tao */
//        testRegionalPrice.testCreate();
        /** Xoa */
//        testRegionalPrice.testDelete();
        /** Tim kiem theo ten thanh pho */
//        testRegionalPrice.testFindByCity();
        /** Tim kiem tuong doi khu vuc */
        testRegionalPrice.testFindByRegionalNameLike();
    }
    
    
    private void ProfileLandTest(){
        TestProfileLand testProfileLand = new TestProfileLand();
        /** Lay tat ca ban ghi */
//        testProfileLand.testFindAll();
        
        /** Tim cac du an da xay dung xong */
        testProfileLand.testFindByConstructionStatus(ProfileLandModelManage.ConstructionStatus.Completed);
    }
}
