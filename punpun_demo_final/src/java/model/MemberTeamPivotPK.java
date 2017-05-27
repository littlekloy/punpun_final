/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;

/**
 *
 * @author kanok
 */
@Embeddable
public class MemberTeamPivotPK implements Serializable {

    @Basic(optional = false)
    @Column(name = "member_id")
    private int memberId;
    @Basic(optional = false)
    @Column(name = "team_id")
    private int teamId;

    public MemberTeamPivotPK() {
    }

    public MemberTeamPivotPK(int memberId, int teamId) {
        this.memberId = memberId;
        this.teamId = teamId;
    }

    public int getMemberId() {
        return memberId;
    }

    public void setMemberId(int memberId) {
        this.memberId = memberId;
    }

    public int getTeamId() {
        return teamId;
    }

    public void setTeamId(int teamId) {
        this.teamId = teamId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) memberId;
        hash += (int) teamId;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MemberTeamPivotPK)) {
            return false;
        }
        MemberTeamPivotPK other = (MemberTeamPivotPK) object;
        if (this.memberId != other.memberId) {
            return false;
        }
        if (this.teamId != other.teamId) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "model.MemberTeamPivotPK[ memberId=" + memberId + ", teamId=" + teamId + " ]";
    }

}
