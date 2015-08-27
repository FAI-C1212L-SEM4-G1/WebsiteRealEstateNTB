package vn.javaweb.real.estate.model;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;
import vn.javaweb.real.estate.model.BuyLand;
import vn.javaweb.real.estate.model.PaymentMode;
import vn.javaweb.real.estate.model.RegionalPrice;

@Generated(value="EclipseLink-2.5.2.v20140319-rNA", date="2015-08-27T17:13:18")
@StaticMetamodel(ProfileLand.class)
public class ProfileLand_ { 

    public static volatile SingularAttribute<ProfileLand, PaymentMode> paymentMode;
    public static volatile SingularAttribute<ProfileLand, Integer> roomArea;
    public static volatile SingularAttribute<ProfileLand, RegionalPrice> codeRegional;
    public static volatile ListAttribute<ProfileLand, BuyLand> buyLandList;
    public static volatile SingularAttribute<ProfileLand, String> location;
    public static volatile SingularAttribute<ProfileLand, String> investors;
    public static volatile SingularAttribute<ProfileLand, String> image;
    public static volatile SingularAttribute<ProfileLand, String> dateEnd;
    public static volatile SingularAttribute<ProfileLand, String> code;
    public static volatile SingularAttribute<ProfileLand, String> typeOf;
    public static volatile SingularAttribute<ProfileLand, String> dateStart;
    public static volatile SingularAttribute<ProfileLand, Double> populationSize;
    public static volatile SingularAttribute<ProfileLand, String> currentStatus;
    public static volatile SingularAttribute<ProfileLand, Integer> totalRoom;
    public static volatile SingularAttribute<ProfileLand, Integer> totalFloor;
    public static volatile SingularAttribute<ProfileLand, String> description;
    public static volatile SingularAttribute<ProfileLand, String> name;
    public static volatile SingularAttribute<ProfileLand, Double> totalArea;
    public static volatile SingularAttribute<ProfileLand, String> introduction;
    public static volatile SingularAttribute<ProfileLand, String> capitalInvestment;

}