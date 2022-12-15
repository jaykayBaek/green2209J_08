SELECT * from j_product;
select * from j_book;
select * from j_author_profile;
select * from j_book_author;
-- 신규 도서 sql문
SELECT b.idx idx_book, p.idx idx_product, title, publisher, isbn, img_saved, name_author -- , 평점까지
 FROM j_product p
  JOIN j_book b on p.idx_book = b.idx

 order by p.idx desc
 limit 20;
 
 -- 도서 클릭 시 검색 뷰에 띄어줄 화면
 SELECT b.idx book_idx, p.idx product_idx, title, publisher, isbn, img_saved, name_author -- , 평점까지
 FROM j_product p
  JOIN j_book b on p.idx_book = b.idx
  join j_book_author ba on ba.idx_book = b.idx 
  join j_author_profile a on a.idx = ba.idx_author
  join j_product_series 
  where p.idx=3 and b.idx=2;



-- 도서 정보
select b.category_sub, b.category_nation, b.category_main,
		b.title, b.publisher, b.date_publishing, b.isbn, b.img_saved,
		p.price_paper, p.price_ebook, p.rate_discount, p.can_reader, p.text_introduce,
		ps.title_series, ps.img_saved, ps.price_series, 
        b.idx, p.idx, ps.idx
	from j_book b
		join j_product p on b.idx=p.idx_book
		join j_product_series ps on ps.idx = p.idx_series;
        
-- 시리즈 정보 구하기
select b.title, b.publisher, b.date_publishing, b.isbn, ps.title_series, b.img_saved,
	b.idx, p.idx, ps.idx
	from j_product p
    join j_book b on b.idx = p.idx_book
    join j_product_series ps on ps.idx=p.idx_series 
    where ps.idx=2;

select b.title, b.publisher, b.date_publishing, b.isbn, ps.title_series, 
b.img_saved, b.idx, p.idx, ps.idx 
from j_product p
join j_book b on b.idx = p.idx_book
join j_product_series ps on ps.idx=p.idx_series
where ps.isbn_series=9781789390278;

select b.category_sub, b.category_nation, b.category_main, 
b.title, b.publisher, b.isbn, b.date_publishing, b.img_saved, 
p.price_paper, p.price_ebook, p.rate_discount, p.can_reader, p.text_introduce, 
ps.title_series, ps.img_saved, ps.price_series, 
b.idx, p.idx, ps.idx
from j_book b
join j_product p on b.idx=p.idx_book
join j_product_series ps on ps.idx = p.idx_series
where b.isbn=9781781105016;

select b.title, b.publisher, b.date_publishing, b.isbn, ps.title_series,
b.img_saved, b.idx, p.idx, ps.idx 
from j_product p 
join j_book b on b.idx = p.idx_book 
join j_product_series ps on ps.idx=p.idx_series
where ps.idx=?;



select * from j_author_profile;
select * from j_product;
select * from j_product_series;
select * from j_book_author;
select * from j_book;
desc j_book;
desc j_product;
desc j_product_series;