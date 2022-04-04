package com.mulcam.artista.dto;

import java.sql.Date;

public class Funding {
		int fundingNo;
		int artistNo;
		String projTitle;
		String projIntro;
		String projBudget;
		String projArtist;
		int targetFunding;
		String fundingDate;
		String thumbImg;
		int applyStatus;
		String refusedContents;
		String getplace;
		String getplace2;
		Date applydate;
		int sumAmount;
		int fundingState;
		int sponsorNo;
		String id;
		int sponsorAmount;
		String email;
		public Funding() {}
		
		public Funding(String projTitle, String projIntro, String projBudget,
				String projArtist, int targetFunding, String fundingDate, String thumbImg,
				String getplace, String getplace2, String id) {
			this.projTitle = projTitle;
			this.projIntro = projIntro;
			this.projBudget = projBudget;
			this.projArtist = projArtist;
			this.targetFunding = targetFunding;
			this.fundingDate = fundingDate;
			this.thumbImg = thumbImg;
			this.getplace = getplace;
			this.getplace2=getplace2;
			this.id=id;
		}
		public Funding(int fundingNo, int artistNo, String projTitle, String projIntro, String projBudget,
				String projArtist, int targetFunding, String fundingDate, String thumbImg, String getplace, int sumAmount, String id,
				int fundingState) {
			this.fundingNo = fundingNo;
			this.artistNo = artistNo;
			this.projTitle = projTitle;
			this.projIntro = projIntro;
			this.projBudget = projBudget;
			this.projArtist = projArtist;
			this.targetFunding = targetFunding;
			this.fundingDate = fundingDate;
			this.thumbImg = thumbImg;
			this.getplace = getplace;
			this.sumAmount = sumAmount;
			this.fundingState = fundingState;
			this.id=id;
		}
		
		public Funding(int fundingNo, int sponsorNo, String id, int sponsorAmount, String email) {
			this.fundingNo = fundingNo;
			this.sponsorNo = sponsorNo;
			this.id = id;
			this.sponsorAmount = sponsorAmount;
			this.email = email;
		}
		public int getFundingNo() {
			return fundingNo;
		}
		public void setFundingNo(int fundingNo) {
			this.fundingNo = fundingNo;
		}
		public int getArtistNo() {
			return artistNo;
		}
		public void setArtistNo(int artistNo) {
			this.artistNo = artistNo;
		}
		public String getProjTitle() {
			return projTitle;
		}
		public void setProjTitle(String projTitle) {
			this.projTitle = projTitle;
		}
		public String getProjIntro() {
			return projIntro;
		}
		public void setProjIntro(String projIntro) {
			this.projIntro = projIntro;
		}
		public String getProjBudget() {
			return projBudget;
		}
		public void setProjBudget(String projBudget) {
			this.projBudget = projBudget;
		}
		public String getProjArtist() {
			return projArtist;
		}
		public void setProjArtist(String projArtist) {
			this.projArtist = projArtist;
		}
		public int getTargetFunding() {
			return targetFunding;
		}
		public void setTargetFunding(int targetFunding) {
			this.targetFunding = targetFunding;
		}
		public String getFundingDate() {
			return fundingDate;
		}
		public void setFundingDate(String fundingDate) {
			this.fundingDate = fundingDate;
		}
		public String getThumbImg() {
			return thumbImg;
		}
		public void setThumbImg(String thumbImg) {
			this.thumbImg = thumbImg;
		}
		public int getApplyStatus() {
			return applyStatus;
		}
		public void setApplyStatus(int applyStatus) {
			this.applyStatus = applyStatus;
		}
		public String getRefusedContents() {
			return refusedContents;
		}
		public void setRefusedContents(String refusedContents) {
			this.refusedContents = refusedContents;
		}
		public String getGetplace() {
			return getplace;
		}
		public void setGetplace(String getplace) {
			this.getplace = getplace;
		}
		
		public String getGetplace2() {
			return getplace2;
		}
		public void setGetplace2(String getplace2) {
			this.getplace2 = getplace2;
		}
		public Date getApplydate() {
			return applydate;
		}
		public void setApplydate(Date applydate) {
			this.applydate = applydate;
		}
		public int getSumAmount() {
			return sumAmount;
		}
		public void setSumAmount(int sumAmount) {
			this.sumAmount = sumAmount;
		}
		public int getFundingState() {
			return fundingState;
		}
		public void setFundingState(int fundingState) {
			this.fundingState = fundingState;
		}
		public int getSponsorNo() {
			return sponsorNo;
		}
		public void setSponsorNo(int sponsorNo) {
			this.sponsorNo = sponsorNo;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public int getSponsorAmount() {
			return sponsorAmount;
		}
		public void setSponsorAmount(int sponsorAmount) {
			this.sponsorAmount = sponsorAmount;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		
		
		
}
