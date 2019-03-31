package com.quinnox.customercomplaint.pojo;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

/*import org.hibernate.validator.constraints.NotEmpty;*/

@Entity
@Table(name="complaint",schema="hr")
public class CustomerPojo implements Serializable {

	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "complaint_sequence")
	@SequenceGenerator(name="complaint_sequence",allocationSize = 1, sequenceName = "complaint_sequence")
	 @Column(name = "complaintid",length=10)
	private int complaintId;
    
	@Column(name = "branchcode",length=20)
	private String branchCode;
    
	@Column(name = "emailid",length=20)
	private String email;
    
	@Column(name = "category",length=20)
	private String category;
    
	@Column(name = "description",length=20)
	private String description;
	
	@Column(name = "priority",length=20)
	private String priority;
	@Column(name = "status",length=20)
	private String status;
	@Column(name = "accountid",length=20)
	private int accountId;
		
	public int getAccountId() {
		return accountId;
	}
	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}
	public int getComplaintId() {
		System.out.println("pojo");
	return complaintId;
	}
	public void setComplaintId(int complaintId) {
	this.complaintId = complaintId;
	}

	public String getBranchCode() {
	return branchCode;
	}
	public void setBranchCode(String branchCode) {
	this.branchCode = branchCode;
	}
	public String getEmail() {
	return email;
	}
	public void setEmail(String email) {
	this.email = email;
	}
	public String getCategory() {
	return category;
	}
	public void setCategory(String category) {
	this.category = category;
	}
	public String getDescription() {
	return description;
	}
	public void setDescription(String description) {
	this.description = description;
	}
	public String getPriority() {
	return priority;
	}
	public void setPriority(String priority) {
		System.out.println("priority");
	this.priority = priority;
	}
	public String getStatus() {
	return status;
	}
	public void setStatus(String status) {
	this.status = status;
	}
	@Override
	public String toString() {
	return "CustomerPojo [complaintId=" + complaintId + ", branchCode=" + branchCode + ", email=" + email
	+ ", category=" + category + ", description=" + description + ", priority=" + priority + ", status="
	+ status + ", accountId=" + accountId + "]";
	}
	
}
