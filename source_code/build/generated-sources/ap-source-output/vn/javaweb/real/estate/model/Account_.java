package vn.javaweb.real.estate.model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import vn.javaweb.real.estate.model.BuyLand;
import vn.javaweb.real.estate.model.Person;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2015-09-03T11:07:56")
@StaticMetamodel(Account.class)
public class Account_ { 

    public static volatile SingularAttribute<Account, String> loginId;
    public static volatile SingularAttribute<Account, Person> person;
    public static volatile ListAttribute<Account, BuyLand> buyLandList;
    public static volatile SingularAttribute<Account, String> status;
    public static volatile SingularAttribute<Account, Integer> role;
    public static volatile SingularAttribute<Account, String> createDate;
    public static volatile SingularAttribute<Account, String> password;

}