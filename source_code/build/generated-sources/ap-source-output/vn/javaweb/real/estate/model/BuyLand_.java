package vn.javaweb.real.estate.model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import vn.javaweb.real.estate.model.Account;
import vn.javaweb.real.estate.model.InvoiceTransaction;
import vn.javaweb.real.estate.model.ProfileLand;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2015-08-25T18:45:26")
@StaticMetamodel(BuyLand.class)
public class BuyLand_ { 

    public static volatile SingularAttribute<BuyLand, ProfileLand> codeProfileLand;
    public static volatile SingularAttribute<BuyLand, Account> username;
    public static volatile SingularAttribute<BuyLand, String> havePay;
    public static volatile ListAttribute<BuyLand, InvoiceTransaction> invoiceTransactionList;
    public static volatile SingularAttribute<BuyLand, String> buyDate;
    public static volatile SingularAttribute<BuyLand, String> code;
    public static volatile SingularAttribute<BuyLand, String> totalPaid;
    public static volatile SingularAttribute<BuyLand, String> note;

}