package vn.javaweb.real.estate.model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import vn.javaweb.real.estate.model.ProfileLand;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2015-08-27T11:43:26")
@StaticMetamodel(RegionalPrice.class)
public class RegionalPrice_ { 

    public static volatile SingularAttribute<RegionalPrice, String> regionalName;
    public static volatile ListAttribute<RegionalPrice, ProfileLand> profileLandList;
    public static volatile SingularAttribute<RegionalPrice, String> unitPrice;
    public static volatile SingularAttribute<RegionalPrice, String> code;
    public static volatile SingularAttribute<RegionalPrice, String> city;
    public static volatile SingularAttribute<RegionalPrice, String> country;

}