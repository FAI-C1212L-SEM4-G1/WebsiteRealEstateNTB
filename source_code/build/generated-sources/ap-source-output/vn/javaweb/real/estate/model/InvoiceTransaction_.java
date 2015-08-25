package vn.javaweb.real.estate.model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import vn.javaweb.real.estate.model.BuyLand;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2015-08-25T22:33:45")
@StaticMetamodel(InvoiceTransaction.class)
public class InvoiceTransaction_ { 

    public static volatile SingularAttribute<InvoiceTransaction, String> paid;
    public static volatile SingularAttribute<InvoiceTransaction, String> code;
    public static volatile SingularAttribute<InvoiceTransaction, BuyLand> codeBuyLand;
    public static volatile SingularAttribute<InvoiceTransaction, String> dateTrans;

}