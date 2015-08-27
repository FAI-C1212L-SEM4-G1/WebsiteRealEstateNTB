package vn.javaweb.real.estate.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.ColumnResult;
import javax.persistence.ConstructorResult;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.SqlResultSetMapping;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author PhanAnh
 */
@Entity
@Table(catalog = "RealEstate", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "ProfileLand.findAll", query = "SELECT p FROM ProfileLand p"),
    @NamedQuery(name = "ProfileLand.findByCode", query = "SELECT p FROM ProfileLand p WHERE p.code = :code"),
    @NamedQuery(name = "ProfileLand.findByNameLike", query = "SELECT p FROM ProfileLand p WHERE p.name LIKE :name"),
    @NamedQuery(name = "ProfileLand.findByLocationLike", query = "SELECT p FROM ProfileLand p WHERE p.location = :location"),
    @NamedQuery(name = "ProfileLand.findByTypeOf", query = "SELECT p FROM ProfileLand p WHERE p.typeOf = :typeOf"),
    @NamedQuery(name = "ProfileLand.findByInvestors", query = "SELECT p FROM ProfileLand p WHERE p.investors = :investors"),
    @NamedQuery(name = "ProfileLand.findByTotalArea", query = "SELECT p FROM ProfileLand p WHERE p.totalArea = :totalArea"),
    @NamedQuery(name = "ProfileLand.findByCapitalInvestment", query = "SELECT p FROM ProfileLand p WHERE p.capitalInvestment = :capitalInvestment"),
    @NamedQuery(name = "ProfileLand.findByDateStart", query = "SELECT p FROM ProfileLand p WHERE p.dateStart = :dateStart"),
    @NamedQuery(name = "ProfileLand.findByDateEnd", query = "SELECT p FROM ProfileLand p WHERE p.dateEnd = :dateEnd"),
    @NamedQuery(name = "ProfileLand.findProfileLandNotStarted", query = "SELECT p FROM ProfileLand p WHERE p.dateStart > :dateCurrent"),
    @NamedQuery(name = "ProfileLand.findProfileLandUnderConstruction", query = "SELECT p FROM ProfileLand p WHERE p.dateStart <= :dateCurrent AND p.dateEnd >= :dateCurrent"),
    @NamedQuery(name = "ProfileLand.findProfileLandCompleted", query = "SELECT p FROM ProfileLand p WHERE p.dateEnd <= :dateCurrent"),
    @NamedQuery(name = "ProfileLand.findByCurrentStatus", query = "SELECT p FROM ProfileLand p WHERE p.currentStatus = :currentStatus"),
    @NamedQuery(name = "ProfileLand.findByPopulationSize", query = "SELECT p FROM ProfileLand p WHERE p.populationSize = :populationSize"),
    @NamedQuery(name = "ProfileLand.findByTotalRoom", query = "SELECT p FROM ProfileLand p WHERE p.totalRoom = :totalRoom"),
    @NamedQuery(name = "ProfileLand.findByTotalFloor", query = "SELECT p FROM ProfileLand p WHERE p.totalFloor = :totalFloor"),
    @NamedQuery(name = "ProfileLand.findByRoomArea", query = "SELECT p FROM ProfileLand p WHERE p.roomArea = :roomArea"),
    @NamedQuery(name = "ProfileLand.findByIntroduction", query = "SELECT p FROM ProfileLand p WHERE p.introduction = :introduction"),
    @NamedQuery(name = "ProfileLand.findByDescription", query = "SELECT p FROM ProfileLand p WHERE p.description = :description"),
    @NamedQuery(name = "ProfileLand.findByImage", query = "SELECT p FROM ProfileLand p WHERE p.image = :image")})
@SqlResultSetMapping(name="ProfileLandResult", classes = {
    @ConstructorResult(targetClass = ProfileLand.class, 
    columns = {@ColumnResult(name="code"), @ColumnResult(name="codeRegional"), @ColumnResult(name="location"), @ColumnResult(name="typeOf"), @ColumnResult(name="investors")
    , @ColumnResult(name="totalArea"), @ColumnResult(name="capitalInvestment"), @ColumnResult(name="dateStart"), @ColumnResult(name="dateEnd"), @ColumnResult(name="currentStatus"), @ColumnResult(name="populationSize")
    , @ColumnResult(name="totalRoom"), @ColumnResult(name="totalFloor"), @ColumnResult(name="roomArea"), @ColumnResult(name="introduction"), @ColumnResult(name="description"), @ColumnResult(name="image")})
})
public class ProfileLand implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(nullable = false, length = 15)
    private String code;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 50)
    @Column(nullable = false, length = 50)
    private String name;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(nullable = false, length = 100)
    private String location;
    @Size(max = 20)
    @Column(length = 20)
    private String typeOf;
    @Size(max = 50)
    @Column(length = 50)
    private String investors;
    // @Max(value=?)  @Min(value=?)//if you know range of your decimal fields consider using these annotations to enforce field validation
    @Column(precision = 53)
    private Double totalArea;
    @Size(max = 10)
    @Column(length = 10)
    private String capitalInvestment;
    @Size(max = 10)
    @Column(length = 10)
    private String dateStart;
    @Size(max = 10)
    @Column(length = 10)
    private String dateEnd;
    @Size(max = 50)
    @Column(length = 50)
    private String currentStatus;
    @Column(precision = 53)
    private Double populationSize;
    private Integer totalRoom;
    private Integer totalFloor;
    private Integer roomArea;
    @Size(max = 4000)
    @Column(length = 4000)
    private String introduction;
    @Size(max = 4000)
    @Column(length = 4000)
    private String description;
    @Size(max = 500)
    @Column(length = 500)
    private String image;
    @OneToOne(cascade = CascadeType.ALL, mappedBy = "codeProfileLand")
    private PaymentMode paymentMode;
    @OneToMany(mappedBy = "codeProfileLand")
    private List<BuyLand> buyLandList;
    @JoinColumn(name = "codeRegional", referencedColumnName = "code")
    @ManyToOne
    private RegionalPrice codeRegional;

    public ProfileLand() {
    }

    public ProfileLand(String code) {
        this.code = code;
    }

    public ProfileLand(String code, String name, String location) {
        this.code = code;
        this.name = name;
        this.location = location;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getTypeOf() {
        return typeOf;
    }

    public void setTypeOf(String typeOf) {
        this.typeOf = typeOf;
    }

    public String getInvestors() {
        return investors;
    }

    public void setInvestors(String investors) {
        this.investors = investors;
    }

    public Double getTotalArea() {
        return totalArea;
    }

    public void setTotalArea(Double totalArea) {
        this.totalArea = totalArea;
    }

    public String getCapitalInvestment() {
        return capitalInvestment;
    }

    public void setCapitalInvestment(String capitalInvestment) {
        this.capitalInvestment = capitalInvestment;
    }

    public String getDateStart() {
        return dateStart;
    }

    public void setDateStart(String dateStart) {
        this.dateStart = dateStart;
    }

    public String getDateEnd() {
        return dateEnd;
    }

    public void setDateEnd(String dateEnd) {
        this.dateEnd = dateEnd;
    }

    public String getCurrentStatus() {
        return currentStatus;
    }

    public void setCurrentStatus(String currentStatus) {
        this.currentStatus = currentStatus;
    }

    public Double getPopulationSize() {
        return populationSize;
    }

    public void setPopulationSize(Double populationSize) {
        this.populationSize = populationSize;
    }

    public Integer getTotalRoom() {
        return totalRoom;
    }

    public void setTotalRoom(Integer totalRoom) {
        this.totalRoom = totalRoom;
    }

    public Integer getTotalFloor() {
        return totalFloor;
    }

    public void setTotalFloor(Integer totalFloor) {
        this.totalFloor = totalFloor;
    }

    public Integer getRoomArea() {
        return roomArea;
    }

    public void setRoomArea(Integer roomArea) {
        this.roomArea = roomArea;
    }

    public String getIntroduction() {
        return introduction;
    }

    public void setIntroduction(String introduction) {
        this.introduction = introduction;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public PaymentMode getPaymentMode() {
        return paymentMode;
    }

    public void setPaymentMode(PaymentMode paymentMode) {
        this.paymentMode = paymentMode;
    }

    @XmlTransient
    public List<BuyLand> getBuyLandList() {
        return buyLandList;
    }

    public void setBuyLandList(List<BuyLand> buyLandList) {
        this.buyLandList = buyLandList;
    }

    public RegionalPrice getCodeRegional() {
        return codeRegional;
    }

    public void setCodeRegional(RegionalPrice codeRegional) {
        this.codeRegional = codeRegional;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (code != null ? code.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof ProfileLand)) {
            return false;
        }
        ProfileLand other = (ProfileLand) object;
        if ((this.code == null && other.code != null) || (this.code != null && !this.code.equals(other.code))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ProfileLand [ code=" + code + " +++ name=" + name + " ]";
    }
    
}
