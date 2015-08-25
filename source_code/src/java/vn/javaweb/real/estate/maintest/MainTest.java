package vn.javaweb.real.estate.maintest;

/**
 *
 * @author NguyenNgoc
 */
public class MainTest {

    public MainTest() {
        //Test bang gia khu vuc
        RegionalPriceTest();
    }
    
    public static void main(String args[]){
        MainTest mainTest = new MainTest();
    }
    
    private void RegionalPriceTest(){
        TestRegionalPrice testRegionalPrice = new TestRegionalPrice();
        //Khoi tao
//        testRegionalPrice.testCreate();
        //Xoa
//        testRegionalPrice.testDelete();
        //Tim kiem theo ten thanh pho
//        testRegionalPrice.testFindByCity();
        //Tim kiem tuong doi khu vuc
        testRegionalPrice.testFindByRegionalNameLike();
    }
    
}
