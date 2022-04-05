package com.mulcam.artista.dto;

import java.sql.Date;

public class ExhibitionApply {
	int exhibitionapplyNo;
	int fundingNo;
	int artistNo;
	String exhibitTitle;
	String exhibitPoster;
	String exhibitArtist;
	Date exhibitStartDate;
	Date exhibitEndDate;
	String exhibitPlace;
	String reserveLink;
	int applyStatus;
	String refusedContents;
	
	ExhibitionApply(){ }
	public int getExhibitionapplyNo() {
		return exhibitionapplyNo;
	}
	public void setExhibitionapplyNo(int exhibitionapplyNo) {
		this.exhibitionapplyNo = exhibitionapplyNo;
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
	public String getExhibitTitle() {
		return exhibitTitle;
	}
	public void setExhibitTitle(String exhibitTitle) {
		this.exhibitTitle = exhibitTitle;
	}
	public String getExhibitPoster() {
		return exhibitPoster;
	}
	public void setExhibitPoster(String exhibitPoster) {
		this.exhibitPoster = exhibitPoster;
	}
	public String getExhibitArtist() {
		return exhibitArtist;
	}
	public void setExhibitArtist(String exhibitArtist) {
		this.exhibitArtist = exhibitArtist;
	}
	public Date getExhibitionStartDate() {
		return exhibitStartDate;
	}
	public void setExhibitionStartDate(Date exhibitionStartDate) {
		this.exhibitStartDate = exhibitionStartDate;
	}
	public Date getExhibitionEndDate() {
		return exhibitEndDate;
	}
	public void setExhibitionEndDate(Date exhibitionEndDate) {
		this.exhibitEndDate = exhibitionEndDate;
	}
	public String getExhibitPlace() {
		return exhibitPlace;
	}
	public void setExhibitPlace(String exhibitPlace) {
		this.exhibitPlace = exhibitPlace;
	}
	public String getReserveLink() {
		return reserveLink;
	}
	public void setReserveLink(String reserveLink) {
		this.reserveLink = reserveLink;
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
}
