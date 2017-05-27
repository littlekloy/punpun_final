/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author kanok
 */
@Entity
@Table(name = "credit_card_info")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "CreditCardInfo.findAll", query = "SELECT c FROM CreditCardInfo c"),
    @NamedQuery(name = "CreditCardInfo.findByInfoId", query = "SELECT c FROM CreditCardInfo c WHERE c.infoId = :infoId"),
    @NamedQuery(name = "CreditCardInfo.findByCardId", query = "SELECT c FROM CreditCardInfo c WHERE c.cardId = :cardId"),
    @NamedQuery(name = "CreditCardInfo.findByExpireDate", query = "SELECT c FROM CreditCardInfo c WHERE c.expireDate = :expireDate"),
    @NamedQuery(name = "CreditCardInfo.findByCvv", query = "SELECT c FROM CreditCardInfo c WHERE c.cvv = :cvv")})
public class CreditCardInfo implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "info_id")
    private Integer infoId;
    @Column(name = "card_id")
    private Integer cardId;
    @Basic(optional = false)
    @Column(name = "expire_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date expireDate;
    @Basic(optional = false)
    @Column(name = "cvv")
    private String cvv;
    @JoinColumn(name = "member_id", referencedColumnName = "member_id")
    @ManyToOne
    private Members memberId;

    public CreditCardInfo() {
    }

    public CreditCardInfo(Integer infoId) {
        this.infoId = infoId;
    }

    public CreditCardInfo(Integer infoId, Date expireDate, String cvv) {
        this.infoId = infoId;
        this.expireDate = expireDate;
        this.cvv = cvv;
    }

    public Integer getInfoId() {
        return infoId;
    }

    public void setInfoId(Integer infoId) {
        this.infoId = infoId;
    }

    public Integer getCardId() {
        return cardId;
    }

    public void setCardId(Integer cardId) {
        this.cardId = cardId;
    }

    public Date getExpireDate() {
        return expireDate;
    }

    public void setExpireDate(Date expireDate) {
        this.expireDate = expireDate;
    }

    public String getCvv() {
        return cvv;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }

    public Members getMemberId() {
        return memberId;
    }

    public void setMemberId(Members memberId) {
        this.memberId = memberId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (infoId != null ? infoId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof CreditCardInfo)) {
            return false;
        }
        CreditCardInfo other = (CreditCardInfo) object;
        if ((this.infoId == null && other.infoId != null) || (this.infoId != null && !this.infoId.equals(other.infoId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.CreditCardInfo[ infoId=" + infoId + " ]";
    }

}
