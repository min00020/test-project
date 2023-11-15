package co.yedam.book.service;

import java.util.List;

public interface BookService {
	public List<BookVO> bookList();    //전체
	public BookVO getBook(String bookvo); // 상세
	public List<BookVO> selectBook(); //
	
	public List<BookVO> bookshop(); // 북샵
}
