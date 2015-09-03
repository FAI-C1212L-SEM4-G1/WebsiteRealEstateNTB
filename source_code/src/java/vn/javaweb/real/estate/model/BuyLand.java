package vn.javaweb.real.estate.model;

import java.io.Serializable;
import java.util.List;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
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
    @NamedQuery(name = "BuyLand.findAll", query = "SELECT b FROM BuyLand b"),
    @NamedQuery(name = "BuyLand.findByCode", query = "SELECT b FROM BuyLand b WHERE b.code = :code"),
    @NamedQuery(name = "BuyLand.findByNote", query = "SELECT b FROM BuyLand b WHERE b.note = :note"),
    @NamedQuery(name = "BuyLand.findByBuyDate", query = "SELECT b FROM BuyLand b WHERE b.buyDate = :buyDate"),
    @NamedQuery(name = "BuyLand.findByTotalPaid", query = "SELECT b FROM BuyLand b WHERE b.totalPaid = :totalPaid"),
    @NamedQuery(name = "BuyLand.findByHavePay", query = "SELECT b FROM BuyLand b WHERE b.havePay = :havePay"),
    @NamedQuery(name = "BuyLand.findBuyerFinish", query = "SELECT b FROM BuyLand b WHERE b.havePay = b.totalPaid AND b.username.role = 2"),
    @NamedQuery(name = "BuyLand.findBuyerIng", query = "SELECT b FROM BuyLand b WHERE b.totalPaid > b.havePay AND b.username.role = 2"),
    @NamedQuery(name = "BuyLand.findBuyerWait", query = "SELECT b FROM BuyLand b WHERE b.username.status = 'WAITING' AND b.username.role = 2")
})
public class BuyLand implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(nullable = false, length = 15)
    private String code;
    @Size(max = 100)
    @Column(length = 100)
    private String note;
    @Size(max = 10)
    @Column(length = 10)
    private String buyDate;
    @Size(max = 10)
    @Column(length = 10)
    private String totalPaid;
    @Size(max = 10)
    @Column(length = 10)
    private String havePay;
    @JoinColumn(name = "codeProfileLand", referencedColumnName = "code")
    @ManyToOne
    private ProfileLand codeProfileLand;
    @JoinColumn(name = "username", referencedColumnName = "loginId")
    @ManyToOne
    private Account username;
    @OneToMany(mappedBy = "codeBuyLand")
    private List<InvoiceTransaction> invoiceTransactionList;

    public BuyLand() {
    }

    public BuyLand(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note;
    }

    public String getBuyDate() {
        return buyDate;
    }

    public void setBuyDate(String buyDate) {
        this.buyDate = buyDate;
    }

    public String getTotalPaid() {
        return totalPaid;
    }

    public void setTotalPaid(String totalPaid) {
        this.totalPaid = totalPaid;
    }

    public String getHavePay() {
        return havePay;
    }

    public void setHavePay(String havePay) {
        this.havePay = havePay;
    }

    public ProfileLand getCodeProfileLand() {
        return codeProfileLand;
    }

    public void setCodeProfileLand(ProfileLand codeProfileLand) {
        this.codeProfileLand = codeProfileLand;
    }

    public Account getUsername() {
        return username;
    }

    public void setUsername(Account username) {
        this.username = username;
    }

    @XmlTransient
    public List<InvoiceTransaction> getInvoiceTransactionList() {
        return invoiceTransactionList;
    }

    public void setInvoiceTransactionList(List<InvoiceTransaction> invoiceTransactionList) {
        this.invoiceTransactionList = invoiceTransactionList;
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
        if (!(object instanceof BuyLand)) {
            return false;
        }
        BuyLand other = (BuyLand) object;
        return !((this.code == null && other.code != null) || (this.code != null && !this.code.equals(other.code)));
    }

    @Override
    public String toString() {
        return "vn.javaweb.real.estate.model.BuyLand[ code=" + code + " ]";
    }
    
}
