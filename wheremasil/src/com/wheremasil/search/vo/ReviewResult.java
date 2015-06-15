package com.wheremasil.search.vo;

public class ReviewResult {

	private String postingId;
	private String reviewContent;
	private String reviewNumber;
	private String reviewTitle;
	private int reviewLike;
	private int reviewHits;
	private String reviewImgPath;
	private String boardtypeId;
	private String memberId;
	
	public ReviewResult(){
		
	}

	public ReviewResult(String postingId, String reviewContent,
			String reviewNumber, String reviewTitle, int reviewLike,
			int reviewHits, String reviewImgPath, String boardtypeId,
			String memberId) {
		super();
		this.postingId = postingId;
		this.reviewContent = reviewContent;
		this.reviewNumber = reviewNumber;
		this.reviewTitle = reviewTitle;
		this.reviewLike = reviewLike;
		this.reviewHits = reviewHits;
		this.reviewImgPath = reviewImgPath;
		this.boardtypeId = boardtypeId;
		this.memberId = memberId;
	}

	public String getPostingId() {
		return postingId;
	}

	public void setPostingId(String postingId) {
		this.postingId = postingId;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewNumber() {
		return reviewNumber;
	}

	public void setReviewNumber(String reviewNumber) {
		this.reviewNumber = reviewNumber;
	}

	public String getReviewTitle() {
		return reviewTitle;
	}

	public void setReviewTitle(String reviewTitle) {
		this.reviewTitle = reviewTitle;
	}

	public int getReviewLike() {
		return reviewLike;
	}

	public void setReviewLike(int reviewLike) {
		this.reviewLike = reviewLike;
	}

	public int getReviewHits() {
		return reviewHits;
	}

	public void setReviewHits(int reviewHits) {
		this.reviewHits = reviewHits;
	}

	public String getReviewImgPath() {
		return reviewImgPath;
	}

	public void setReviewImgPath(String reviewImgPath) {
		this.reviewImgPath = reviewImgPath;
	}

	public String getBoardtypeId() {
		return boardtypeId;
	}

	public void setBoardtypeId(String boardtypeId) {
		this.boardtypeId = boardtypeId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((boardtypeId == null) ? 0 : boardtypeId.hashCode());
		result = prime * result
				+ ((memberId == null) ? 0 : memberId.hashCode());
		result = prime * result
				+ ((postingId == null) ? 0 : postingId.hashCode());
		result = prime * result
				+ ((reviewContent == null) ? 0 : reviewContent.hashCode());
		result = prime * result + reviewHits;
		result = prime * result
				+ ((reviewImgPath == null) ? 0 : reviewImgPath.hashCode());
		result = prime * result + reviewLike;
		result = prime * result
				+ ((reviewNumber == null) ? 0 : reviewNumber.hashCode());
		result = prime * result
				+ ((reviewTitle == null) ? 0 : reviewTitle.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ReviewResult other = (ReviewResult) obj;
		if (boardtypeId == null) {
			if (other.boardtypeId != null)
				return false;
		} else if (!boardtypeId.equals(other.boardtypeId))
			return false;
		if (memberId == null) {
			if (other.memberId != null)
				return false;
		} else if (!memberId.equals(other.memberId))
			return false;
		if (postingId == null) {
			if (other.postingId != null)
				return false;
		} else if (!postingId.equals(other.postingId))
			return false;
		if (reviewContent == null) {
			if (other.reviewContent != null)
				return false;
		} else if (!reviewContent.equals(other.reviewContent))
			return false;
		if (reviewHits != other.reviewHits)
			return false;
		if (reviewImgPath == null) {
			if (other.reviewImgPath != null)
				return false;
		} else if (!reviewImgPath.equals(other.reviewImgPath))
			return false;
		if (reviewLike != other.reviewLike)
			return false;
		if (reviewNumber == null) {
			if (other.reviewNumber != null)
				return false;
		} else if (!reviewNumber.equals(other.reviewNumber))
			return false;
		if (reviewTitle == null) {
			if (other.reviewTitle != null)
				return false;
		} else if (!reviewTitle.equals(other.reviewTitle))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "ReviewResult [postingId=" + postingId + ", reviewContent="
				+ reviewContent + ", reviewNumber=" + reviewNumber
				+ ", reviewTitle=" + reviewTitle + ", reviewLike=" + reviewLike
				+ ", reviewHits=" + reviewHits + ", reviewImgPath="
				+ reviewImgPath + ", boardtypeId=" + boardtypeId
				+ ", memberId=" + memberId + "]";
	}
	
	 
}
