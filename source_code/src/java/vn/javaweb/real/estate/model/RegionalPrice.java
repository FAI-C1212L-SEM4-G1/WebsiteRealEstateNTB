package vn.javaweb.real.estate.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author PhanAnh
 */
@Entity
@Table(catalog = "RealEstate", schema = "dbo", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"regionalName"})})
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "RegionalPrice.findAll", query = "SELECT r FROM RegionalPrice r"),
    @NamedQuery(name = "RegionalPrice.findByCode", query = "SELECT r FROM RegionalPrice r WHERE r.code = :code"),
    @NamedQuery(name = "RegionalPrice.findByRegionalNameLike", query = "SELECT r FROM RegionalPrice r WHERE r.regionalName LIKE :regionalName"),
    @NamedQuery(name = "RegionalPrice.findByCity", query = "SELECT r FROM RegionalPrice r WHERE r.city = :city"),
    @NamedQuery(name = "RegionalPrice.findByCountry", query = "SELECT r FROM RegionalPrice r WHERE r.country = :country"),
    @NamedQuery(name = "RegionalPrice.findByUnitPrice", query = "SELECT r FROM RegionalPrice r WHERE r.unitPrice = :unitPrice")})
public class RegionalPrice implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(nullable = false, length = 15)
    private String code;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 100)
    @Column(nullable = false, length = 100)
    private String regionalName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(nullable = false, length = 20)
    private String city;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(nullable = false, length = 20)
    private String country;
    @Size(max = 10)
    @Column(length = 10)
    private String unitPrice;
    @OneToMany(mappedBy = "codeRegional")
    private List<ProfileLand> profileLandList;

    public RegionalPrice() {
    }

    public RegionalPrice(String code) {
        this.code = code;
    }

    public RegionalPrice(String code, String regionalName, String city, String country) {
        this.code = code;
        this.regionalName = regionalName;
        this.city = city;
        this.country = country;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getRegionalName() {
        return regionalName;
    }

    public void setRegionalName(String regionalName) {
        this.regionalName = regionalName;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(String unitPrice) {
        this.unitPrice = unitPrice;
    }

    @XmlTransient
    public List<ProfileLand> getProfileLandList() {
        return profileLandList;
    }

    public void setProfileLandList(List<ProfileLand> profileLandList) {
        this.profileLandList = profileLandList;
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
        if (!(object instanceof RegionalPrice)) {
            return false;
        }
        RegionalPrice other = (RegionalPrice) object;
        if ((this.code == null && other.code != null) || (this.code != null && !this.code.equals(other.code))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "vn.javaweb.real.estate.model.RegionalPrice[ code=" + code + " ]";
    }
    
}
