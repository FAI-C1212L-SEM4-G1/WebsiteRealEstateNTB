package vn.javaweb.real.estate.maintest;

import java.util.List;
import vn.javaweb.real.estate.model.Account;
import vn.javaweb.real.estate.model.ConfigConnection;

/**
 *
 * @author PhanAnh
 */
public class TestAccount {

    public TestAccount() {
    }
    
    protected void testFindUserBetween(int indexStart, int indexEnd){
        List<Account> list = ConfigConnection.getInstance().getAccountModelManage().findUserBetween(indexStart, indexEnd);
        System.out.println("Ket qua testFindUserBetween: ");
        for(Account a : list){
            System.out.println("_ " + a.toString());
        }
        System.out.println("Tong so ket qua: " + list.size());
    }
}
