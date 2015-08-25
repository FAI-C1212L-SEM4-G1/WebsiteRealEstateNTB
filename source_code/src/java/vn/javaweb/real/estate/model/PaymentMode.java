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
 * @author NguyenNgoc
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (code != null ? code.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof PaymentMode)) {
            return false;
        }
        PaymentMode other = (PaymentMode) object;
        if ((this.code == null && other.code != null) || (this.code != null && !this.code.equals(other.code))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "vn.javaweb.real.estate.model.PaymentMode[ code=" + code + " ]";
    }
    
}
