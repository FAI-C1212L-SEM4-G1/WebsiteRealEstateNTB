package vn.javaweb.real.estate.model;

import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import vn.javaweb.real.estate.model.Account;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2015-08-27T19:07:20")
@StaticMetamodel(Person.class)
public class Person_ { 

    public static volatile SingularAttribute<Person, String> id;
    public static volatile SingularAttribute<Person, String> birthday;
    public static volatile SingularAttribute<Person, Account> username;
    public static volatile SingularAttribute<Person, String> address;
    public static volatile SingularAttribute<Person, String> email;
    public static volatile SingularAttribute<Person, String> tel;
    public static volatile SingularAttribute<Person, String> gender;
    public static volatile SingularAttribute<Person, String> avatar;
    public static volatile SingularAttribute<Person, String> fullname;
    public static volatile SingularAttribute<Person, String> note;

}