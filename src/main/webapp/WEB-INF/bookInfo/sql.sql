

select title, publisher, date_publishing, isbn, name_author, role, author_ordinal
 from j_book b
  join j_book_author ba on b.idx = ba.idx_book
  join j_author_profile a on a.idx = ba.idx_author
 where isbn = 9781781106303;
 
select * from j_author_profile ap
join j_book_author ba on ba.idx_author=ap.idx
where ba.idx_book = 2;

delete from j_wishlist where idx_user = 1 AND idx_product in ('5,8');

select count(idx_user) count
from j_wishlist
where idx_user = 1;

-- 주문목록가기
select b.img_saved, p.idx, p.price_ebook, p.rate_discount, b.title, ap.name_author, b.isbn
from j_product p
join j_book b on b.idx = p.idx_book
join j_book_author ba on ba.idx_book = b.idx
join j_author_profile ap on ap.idx = ba.idx_author and ba.author_ordinal = 0
where p.idx in(2,3,4,5,6,7);

-- 포인트 사용




CREATE TABLE `j_mylib` (
	`idx`	bigint(20)	auto_increment primary key,
	`idx_book`	bigint(20)	not null,
	`idx_user`	bigint(20)	NOT NULL,
    FOREIGN KEY (idx_book) REFERENCES j_book(idx)
    ON UPDATE cascade on delete cascade,
    FOREIGN KEY (idx_user) REFERENCES j_user(idx)
	ON UPDATE cascade on delete cascade
);

CREATE TABLE `j_order_book_info` (
	`idx`	bigint(20)	auto_increment primary key,
	`idx_order_list`	bigint(20)	NOT NULL,
	`idx_product`	bigint(20) NULL,
	FOREIGN KEY (idx_product) REFERENCES j_product(idx)
    ON UPDATE cascade on delete set nullj_product_series,
    FOREIGN KEY (idx_order_list) REFERENCES j_order_list(idx)
	ON UPDATE cascade on delete cascade
);
CREATE TABLE `j_order_list` (
	`idx`	bigint(20)	auto_increment primary key,
	`idx_user`	bigint(20)	NULL,
	`order_no`	varchar(20)	NULL,
	`price_order`	int	NOT NULL,
	`price_sales`	int	NOT NULL,
	`price_point_used`	int	NOT NULL,
	`price_payment`	int	NOT NULL,
	`option_choosing`	VARCHAR(11)	NOT NULL,
	`point_earned`	int	NOT NULL,
	`date_purchased`	datetime default now(),
	`birthyear`	VARCHAR(11)	NULL,
	`phone_no`	VARCHAR(15)	NULL,
	`gender`	VARCHAR(4)	NULL,
	`job`	VARCHAR(10)	NULL,
	FOREIGN KEY (idx_user) REFERENCES j_user(idx)
	ON UPDATE cascade on delete set null
);

select ;

SELECT b.idx bookIdx FROM j_product p
JOIN j_book b ON b.idx =  p.idx_book
WHERE p.idx in (2,3,4);

-- 최근 order idx 가져오기
select idx from j_order_list
where idx_user = 1 order by idx desc limit 1;

SELECT count(idx_user) cnt FROM j_order_list WHERE idx_user = 1;

SELECT * FROM j_order_list WHERE idx_user = 1;

update j_user SET point=point+531 WHERE idx = 1;

INSERT INTO j_mylib (idx, idx_book, idx_user) VALUES ('값1','값2','');
		
desc j_order_list;

-- 최근 주문번호 구하기
select order_no 
from j_order_list
where date_purchased > curdate()
order by order_no desc
limit 1;

SELECT COUNT(idx_user) count 
FROM j_wishlist 
WHERE idx_user = 1;


SELECT idx, idx_user, order_no, price_order, price_sales, price_point_used, 
price_payment, option_choosed, point_earned, date_purchased 
FROM j_order_list 
WHERE idx_user = 1
ORDER BY date_purchased desc;

-- 주문 리스트
select * from
j_order_list ol
where order_no = 202212191000 and idx_user = 1;
-- 주문 리스트 중 도서
select b.title, b.isbn, p.idx idxProduct, ol.idx idxOrderList, obi.idx
from j_order_book_info obi
JOIN j_product p on p.idx = obi.idx_product
JOIN j_book b on b.idx = p.idx_book
JOIN j_order_list ol ON ol.idx = obi.idx_order_list
WHERE ORDER_NO =  202212191000 and idx_user = 1;

-- mylib
select * 
from j_mylib ml
join j_book b on b.idx = ml.idx_book
join j_product p on p.idx_book = b.idx
join j_product_series ps on ps.idx = p.idx_series
join j_user u on u.idx = ml.idx_user
WHERE u.idx = 1;
-- 위에서 추린 것
select ps.title_series, ps.isbn_series, ps.idx, ml.idx, ps.img_saved, count(ps.isbn_series) cnt
from j_mylib ml
join j_book b on b.idx = ml.idx_book
join j_product p on p.idx_book = b.idx
join j_product_series ps on ps.idx = p.idx_series
join j_user u on u.idx = ml.idx_user
WHERE u.idx = 1
group by title_series;

select count(idx_book) cnt from j_mylib where idx_user=1;

-- 시리즈에 포함되어 있는 구매한 책들 가져오기
select b.title, b.img_saved, b.isbn, b.text_content from j_order_book_info obi
join j_order_list ol on ol.idx=obi.idx_order_list
join j_product p on obi.idx_product = p.idx
join j_book b on b.idx = p.idx_book
where idx_series = 2 AND idx_user = 1;

SELECT b.title, b.img_saved, b.isbn, b.text_content 
FROM j_order_book_info obi 
JOIN j_order_list ol ON ol.idx=obi.idx_order_list 
JOIN j_product p ON obi.idx_product = p.idx
JOIN j_book b ON b.idx = p.idx_book 
WHERE idx_series = 2 AND idx_user = 1;

-- 시리즈에 포함되어 있는 구매하지 않은 책들 가져오기
select b.title, b.img_saved, b.isbn from j_product p
join j_product_series ps on ps.idx=p.idx_series
join j_book b on b.idx = p.idx_book
where idx_series = 2;

SELECT b.title, b.text_content 
FROM j_order_book_info obi 
JOIN j_order_list ol ON ol.idx=obi.idx_order_list 
JOIN j_product p ON obi.idx_product = p.idx
JOIN j_book b ON b.idx = p.idx_book 
WHERE b.isbn = 9781781106426 AND idx_user = 1;


-- 평점 달았는지 체킹
select idx_user
from j_book_review
where idx_product = 1 and idx_user = 1;

-- 구매자 체킹
select idx_book from j_mylib where idx_user = 1 and idx_book = 1;

select br.idx, br.idx_product, br.idx_user, br.content_review, br.star_rating, br.date_created,
br.buy_check, br.hidden, br.spoiler_check, u.email
from j_book_review br
join j_user u on u.idx = br.idx_user
where idx_product = 5
order by idx desc
limit 0, 20;

-- 리뷰 총 자료건수
select count(*) as 	totalCnt from j_book_review
where idx_product = 5;

-- 제품 idx 책 isbn으로 구하기
select p.idx productIdx
from j_book b
join j_product p on p.idx_book=b.idx
where b.isbn = 9781781104996;

SELECT p.idx productIdx 
FROM j_book b 
JOIN j_product p ON p.idx_book=b.idx 
WHERE b.isbn = 9781781106389;

SELECT br.idx, br.idx_product, br.idx_user, br.content_review, br.star_rating, br.date_created,
br.buy_check, br.hidden, br.spoiler_check, u.email 
FROM j_book_review br 
JOIN j_user u ON u.idx = br.idx_user 
WHERE idx_product = 3
ORDER BY idx DESC 
limit 1, 10;

-- 어떤 리뷰에 어떤 댓글이 달렸고 누가 달았는지 가져오기


select rc.idx, rc.idx_book_review idx_review, rc.idx_user,
rc.content_reply, rc.date_created, rc.hidden, u.email
from j_book_review_cmt rc
join j_user u on u.idx = rc.idx_user
join j_book_review br on br.idx = rc.idx_book_review
where rc.idx_book_review = 163;

-- 리뷰 가져오기
SELECT br.idx, br.idx_product, br.idx_user, br.content_review, br.star_rating, br.date_created, 
br.buy_check, br.hidden, br.spoiler_check, u.email,
	(SELECT count(idx)
		FROM j_book_review_like
        WHERE idx_review = br.idx) likeNum,
	(SELECT idx_user
		FROM j_book_review_like
        WHERE idx_review = br.idx) idxUserLike
FROM j_book_review br 
-- JOIN j_book_review_like rl on rl.idx_review
JOIN j_user u ON u.idx = br.idx_user
WHERE idx_product = 3
ORDER BY idx DESC 
LIMIT 1, 10;

-- 도서 검색
SELECT p.idx, b.idx, ap.idx, b.img_saved, b.title, b.isbn, ap.name_author, p.text_introduce,
	round((SELECT sum(star_rating) / count(star_rating) FROM j_book_review br where br.idx_product = p.idx), 1) starRating, 
	(SELECT count(idx) FROM j_book_review br where br.idx_product = p.idx) reviewCnt, p.price_ebook
FROM j_product p
JOIN j_book b on b.idx = p.idx_book
join j_book_author ba on ba.idx_book = b.idx
join j_author_profile ap on ap.idx = ba.idx_author
where ba.author_ordinal = 0 AND b.title like '%해리%'
order by p.idx desc
limit 1, 10;

-- 검색결과 토탈구하기
select count(idx)
from j_book
where title like '%해리%';

select * from j_user;

-- 결과창
SELECT p.idx, b.idx, ap.idx, b.img_saved, b.title, b.isbn, ap.name_author, p.text_introduce, 
ROUND((SELECT sum(star_rating) / COUNT(star_rating) FROM j_book_review br WHERE br.idx_product = p.idx), 1) starRating,
SELECT count(idx) FROM j_book_review br where br.idx_product = p.idx) reviewCnt,  p.price_ebook 
FROM j_product p
JOIN j_book b ON b.idx = p.idx_book 
JOIN j_book_author ba ON ba.idx_book = b.idx 
JOIN j_author_profile ap ON ap.idx = ba.idx_author 
WHERE ba.author_ordinal = 0 AND b.title like '%해리%'
order by p.idx desc;



-- 관리자뷰
select sum(price_payment)
from j_order_list
WHERE datediff(date_purchased, now())<=7;

-- 주간 매출
select sum(price_payment)
from j_order_list
WHERE datediff(date_purchased, now())<=7;

-- 월간 매출
select month(date_purchased) date, 
	sum(price_payment) 
from j_order_list
group by date;

-- 카테고리별로 판매 금액을 구하시오
select sum(ol.price_payment) revenue, b.category_main
from j_order_list ol 
join j_order_book_info bi on bi.idx_order_list = ol.idx
join j_product p on p.idx = bi.idx_product
join j_book b on b.idx = p.idx_book
group by b.category_main, b.category_main;
select sum(ol.price_payment) revenue, b.category_main
from j_order_list ol 
join j_order_book_info bi on bi.idx_order_list = ol.idx
join j_product p on p.idx = bi.idx_product
join j_book b on b.idx = p.idx_book
group by b.category_main, b.category_main;

-- 내가 작성한 리뷰
select br.idx, br.idx_product, br.idx_user, b.title, b.isbn, br.content_review, br.star_rating,
br.date_created, br.buy_check, br.hidden, br.spoiler_check
from j_book_review br
join j_product p on p.idx = br.idx_product
join j_book b on b.idx = p.idx_book 
where idx_user = 1
order by idx desc;

-- 리뷰 삭제 전 리뷰에 댓글 있는지 확인
select idx from j_book_review_cmt rc where rc.idx_book_review = 168;

select * from j_book_review_cmt rc;

select * from j_book_review br;

-- 숨김처리 리뷰 불러오기
SELECT br.idx, br.idx_product, br.idx_user, u.email, b.title, br.content_review, br.star_rating, 
br.date_created, br.buy_check, br.hidden, br.spoiler_check, b.isbn 
FROM j_book_review br 
JOIN j_product p ON p.idx = br.idx_product 
JOIN j_book b ON b.idx = p.idx_book
join j_user u on u.idx = br.idx_user
WHERE hidden = 1
ORDER BY idx DESC;

-- 리뷰 합
SELECT p.idx, b.idx, ap.idx, b.img_saved, b.title, b.isbn, ap.name_author, p.text_introduce, 
round((SELECT sum(star_rating) / count(star_rating) FROM j_book_review br where br.idx_product = p.idx), 1) starRating, 
(SELECT count(idx) FROM j_book_review br where br.idx_product = p.idx) reviewCnt, p.price_ebook 
FROM j_product p
JOIN j_book b on b.idx = p.idx_book
join j_book_author ba on ba.idx_book = b.idx
join j_author_profile ap on ap.idx = ba.idx_author;


-- 책 가져오기
SELECT b.category_sub, b.category_nation, b.category_main, 
b.title, b.publisher, b.isbn, b.date_publishing, b.img_saved, 
p.price_paper, p.price_ebook, p.rate_discount, p.can_reader, p.text_introduce, 
ps.title_series, ps.img_saved, ps.price_series, 
b.idx, p.idx, ps.idx, 
round((SELECT sum(star_rating) / count(star_rating) FROM j_book_review br where br.idx_product = p.idx), 1) starRating, 
(SELECT count(idx) FROM j_book_review br where br.idx_product = p.idx) reviewCnt
FROM j_book b 
JOIN j_product p ON b.idx=p.idx_book 
JOIN j_product_series ps ON ps.idx = p.idx_series 
WHERE b.isbn = 9781781105009;


select * from j_book;
select * from j_book_author;
select * from j_user; 
select * from j_author_profile;
select * from j_product;
select * from j_product_series;
select * from j_wishlist;
select * from j_order_list;
select * from j_order_book_info;
select * from j_mylib;
select * from j_book_review;
select * from j_book_review_like;
select * from j_book_review_cmt;
select * from j_product;
select * from j_user_withdrawal;
desc j_user_withdrawal;

select count(idx_product) cnt, b.title, b.isbn, b.img_saved
from j_order_book_info bi
join j_product p on p.idx=bi.idx_product
join j_book b on b.idx = p.idx_book
group by idx_product
order by cnt desc
limit 20;

drop table j_user_withdrawal;

CREATE TABLE `j_user_withdrawal` (
	`idx` BIGINT(20) NOT NULL AUTO_INCREMENT,
	`reason_withdrawal` VARCHAR(40) NULL DEFAULT NULL,
	`email_user` VARCHAR(255) NULL DEFAULT NULL,
	`date_deleted` DATETIME DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (`idx`)
);

CREATE TABLE `j_book_review` (
	`idx`	bigint(20)	primary key auto_increment,
	`idx_product`	bigint(20)	NOT NULL,
	`idx_user`	bigint(20)	NOT NULL,
	`content_review`	text NULL,
	`star_rating`	int	NULL,
	`date_created`	datetime	default now(),
	`buy_check`	bit(1)	NULL,
	`hidden`	bit(1)	DEFAULT 0,
	spoil_check bit(1) null,
    FOREIGN KEY (idx_product) REFERENCES j_product (idx),
    FOREIGN KEY (idx_user) REFERENCES j_user (idx)
);

CREATE TABLE `j_book_review_cmt` (
	idx bigint(20)	primary key auto_increment,
	`content_reply`	varchar(100)	NULL,
	`idx_book_review`	bigint(20)	NOT NULL,
	`idx_user`	bigint(20)	NOT NULL,
	`hidden`	bit(1)	DEFAULT 0,
    date_created datetime default now(),
	FOREIGN KEY (idx_book_review) REFERENCES j_book_review (idx),
    FOREIGN KEY (idx_user) REFERENCES j_user (idx)
);

CREATE TABLE `j_book_review_like` (
	`idx`	bigint(20)	primary key auto_increment,
	`idx_review`	bigint(20)	NOT NULL,
	`idx_user`	bigint(20)	NOT NULL,
	FOREIGN KEY (idx_review) REFERENCES j_book_review (idx),
    FOREIGN KEY (idx_user) REFERENCES j_user (idx)
);


drop table j_book_review_cmt;
drop table j_book_review_like;