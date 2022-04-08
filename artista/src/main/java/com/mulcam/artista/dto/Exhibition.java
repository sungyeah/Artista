package com.mulcam.artista.dto;

public class Exhibition {
	int exhibitNo;
	int fundingNo;
	int artistNo;
	String exhibitTitle;
	String exhibitPoster;
	String exhibitArtist;
	String startDate;
	String endDate;
	String exhibitPlace;
	String reserveLink;
	
	public Exhibition(){ }
	public Exhibition(int exhibitNo, int fundingNo, int artistNo, String exhibitTitle, String exhibitPoster, String exhibitArtist, 
			String startDate, String endDate, String exhibitPlace, String reserveLink){
		this.exhibitNo = exhibitNo;
		this.fundingNo = fundingNo;
		this.artistNo = artistNo;
		this.exhibitTitle = exhibitTitle;
		this.exhibitPoster = exhibitPoster;
		this.exhibitArtist = exhibitArtist;
		this.startDate = startDate;
		this.endDate = endDate;
		this.exhibitPlace = exhibitPlace;
		this.reserveLink = reserveLink;
	}

	public int getExhibitNo() {
		return exhibitNo;
	}

	public void setExhibitNo(int exhibitNo) {
		this.exhibitNo = exhibitNo;
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

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
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
	
}
