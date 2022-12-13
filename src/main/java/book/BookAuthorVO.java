package book;

import java.util.Arrays;

public class BookAuthorVO {
	private int idx;
	private int[] idxAuthor;
	private int idxBook;
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public int[] getIdxAuthor() {
		return idxAuthor;
	}
	public void setIdxAuthor(int[] idxAuthor) {
		this.idxAuthor = idxAuthor;
	}
	public int getIdxBook() {
		return idxBook;
	}
	public void setIdxBook(int idxBook) {
		this.idxBook = idxBook;
	}
	@Override
	public String toString() {
		return "BookAuthorVO [idx=" + idx + ", idxAuthor=" + Arrays.toString(idxAuthor) + ", idxBook=" + idxBook + "]";
	}
	
	
	
	
}
