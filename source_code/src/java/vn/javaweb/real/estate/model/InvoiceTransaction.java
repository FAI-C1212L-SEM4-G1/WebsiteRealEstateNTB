/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.javaweb.real.estate.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author NguyenNgoc
 */
@Entity
@Table(catalog = "RealEstate", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "InvoiceTransaction.findAll", query = "SELECT i FROM InvoiceTransaction i"),
    @NamedQuery(name = "InvoiceTransaction.findByCode", query = "SELECT i FROM InvoiceTransaction i WHERE i.code = :code"),
    @NamedQuery(name = "InvoiceTransaction.findByDateTrans", query = "SELECT i FROM InvoiceTransaction i WHERE i.dateTrans = :dateTrans"),
    @NamedQuery(name = "InvoiceTransaction.findByPaid", query = "SELECT i FROM InvoiceTransaction i WHERE i.paid = :paid")})
public class InvoiceTransaction implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 15)
    @Column(nullable = false, length = 15)
    private String code;
    @Size(max = 10)
    @Column(length = 10)
    private String dateTrans;
    @Size(max = 10)
    @Column(length = 10)
    private String paid;
    @JoinColumn(name = "codeBuyLand", referencedColumnName = "code")
    @ManyToOne
    private BuyLand codeBuyLand;

    public InvoiceTransaction() {
    }

    public InvoiceTransaction(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDateTrans() {
        return dateTrans;
    }

    public void setDateTrans(String dateTrans) {
        this.dateTrans = dateTrans;
    }

    public String getPaid() {
        return paid;
    }

    public void setPaid(String paid) {
        this.paid = paid;
    }

    public BuyLand getCodeBuyLand() {
        return codeBuyLand;
    }

    public void setCodeBuyLand(BuyLand codeBuyLand) {
        this.codeBuyLand = codeBuyLand;
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
        if (!(object instanceof InvoiceTransaction)) {
            return false;
        }
        InvoiceTransaction other = (InvoiceTransaction) object;
        if ((this.code == null && other.code != null) || (this.code != null && !this.code.equals(other.code))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "vn.javaweb.real.estate.model.InvoiceTransaction[ code=" + code + " ]";
    }
    
}
