package vn.javaweb.real.estate.model;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author PhanAnh
 */
@Entity
@Table(catalog = "RealEstate", schema = "dbo", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"codeProfileLand"})})
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "PaymentMode.findAll", query = "SELECT p FROM PaymentMode p"),
    @NamedQuery(name = "PaymentMode.findByCode", query = "SELECT p FROM PaymentMode p WHERE p.code = :code"),
    @NamedQuery(name = "PaymentMode.findByCountPay", query = "SELECT p FROM PaymentMode p WHERE p.countPay = :countPay"),
    @NamedQuery(name = "PaymentMode.findByPercentPay", query = "SELECT p FROM PaymentMode p WHERE p.percentPay = :percentPay"),
    @NamedQuery(name = "PaymentMode.findByNote", query = "SELECT p FROM PaymentMode p WHERE p.note = :note")})
public class PaymentMode implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(nullable = false, length = 15)
    private String code;
    private Integer countPay;
    @Size(max = 50)
    @Column(length = 50)
    private String percentPay;
    @Size(max = 100)
    @Column(length = 100)
    private String note;
    @JoinColumn(name = "codeProfileLand", referencedColumnName = "code", nullable = false)
    @OneToOne(optional = false)
    private ProfileLand codeProfileLand;

    public PaymentMode() {
    }

    public PaymentMode(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public Integer getCountPay() {
        return countPay;
    }

    public void setCountPay(Integer countPay) {
        this.countPay = countPay;
    }

    public String getPercentPay() {
        return percentPay;
    }

    public void setPercentPay(String percentPay) {
        this.percentPay = percentPay;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public ProfileLand getCodeProfileLand() {
        return codeProfileLand;
    }

    public void setCodeProfileLand(ProfileLand codeProfileLand) {
        this.codeProfileLand = codeProfileLand;
    }
    
    public List<SessionPay> getTimePayment() throws ParseException{
        List<SessionPay> sprintPays = new ArrayList<>();
        String[] splitPercentPay = percentPay.split(",");
        String[] splitTimePay = note.split(",");
        for(int i = 0; i < countPay; i++){
            SessionPay sprintPay = new SessionPay();
            sprintPay.setId(i+1);
            sprintPay.setTimePay(new SimpleDateFormat("dd/MM/yyyy").parse(splitTimePay[i]));
            sprintPay.setPercentPay(Double.parseDouble(splitPercentPay[i]));
            sprintPay.setPricePay((Double.parseDouble(codeProfileLand.getCodeRegional().getUnitPrice()) * codeProfileLand.getRoomArea() * 30 / 100) + "");
            sprintPays.add(sprintPay);
        }        
        return sprintPays;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (code != null ? code.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final PaymentMode other = (PaymentMode) obj;
        return Objects.equals(this.code, other.code);
    }

    @Override
    public String toString() {
        return "vn.javaweb.real.estate.model.PaymentMode[ code=" + code + " ]";
    }
    
}
