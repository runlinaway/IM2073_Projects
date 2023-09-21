CREATE DATABASE webshopdb;
USE webshopdb;
CREATE TABLE products (
	id int NOT NULL AUTO_INCREMENT,
	model varchar(150) NOT NULL,
    brand varchar(50) NOT NULL,
    ref_no varchar(50),
    price float NOT NULL,
    about varchar(10000),
    rating int,
    qty int NOT NULL,
    imgsrc varchar(50),
	PRIMARY KEY (id)
);

CREATE TABLE cart(
	id int NOT NULL AUTO_INCREMENT,
    product_id int NOT NULL,
    qty INT,
    FOREIGN KEY(product_id) REFERENCES products(id),
    PRIMARY KEY (id)
);

CREATE TABLE customers (
	id int not null auto_increment,
    username varchar(50) not null,
    passwrd varchar(50) not null,
    address varchar(150) not null,
    phone int,
    email varchar(50),
    PRIMARY KEY (id)
);

INSERT INTO PRODUCTS (model, brand, ref_no, price, rating, qty, imgsrc, about)
VALUES
('AUDEMARS PIGUET ROYAL OAK OFFSHORE MUSIC EDITION', 
'Audemars Piguet', '15600TI.OO.A343CA.01', 97185.00, 4, 3, 'images/product-1.webp',
'We are very excited to be offering this Stunning Audemars Piguet Royal oak Offshore Music Edition - 15600TI.OO.A343CA.01. 

This piece boasts a 43mm titanium Case, Blue interchangeable Rubber Strap, Sapphire Crystal and comes with the self-winding Automatic movement. 

The incredible piece is music inspired and features a dial which represents a VU Meter and the push piece guards evoking mixer faders.

This watch comes as a full set ( Box & papers ) in Excellent condition with little to no signs of wear.'),

('AUDEMARS PIGUET CODE 11.59 CHRONOGRAPH', 
'Audemars Piguet', '26393NB.OO.A002KB.01', 62512.00, 4, 4, 'images/product-2.webp',
'18-carat white gold meets black ceramics in this multi-faceted piece, topped off with a smoked grey dial finished with vertical satin-brushing.

Smoked grey dial with vertical satin-finished base, white gold applied hour-markers and hands, black inner bezel.'),

('ROLEX SUBMARINER DATE', 
'Rolex', '126610LN', 20838.00, 4, 4,  'images/product-3.webp',
'We are pleased to present, in excellent condition, this Rolex Submariner 126610LN dated from September 2022.

This watch features a 41mm Stainless Steel Case, Black Bezel, Black Dial and Stainless Steel Oyster Bracelet. What keeps this watch ticking is the Calibre 3235, an automatic Movement.

This watch comes as a Full Set (Box & Papers) and will benefit from the remaining Rolex 5 Year manufacture warranty.'),

('ROLEX GMT-MASTER II', 
'Rolex', '116710LN', 19685.00, 5, 4,  'images/product-4.webp',
'Presented in Excellent condition, with little to no signs of wear, this is an amazing example of a 2012 GMT Master II, 116710LN, a discontinued GMT-Master II.

This watch features a 40mm stainless steel case, black dial, black ceramic bezel, oyster bracelet and is powered by an automatic movement, the Calibre 3186.

This watch comes with the Box & Original Rolex Papers (Warranty Card). You will benefit from a 24 Month Warranty.'),

('ROLEX DAY-DATE 40', 
'Rolex', '228239', 131694.00, 5, 1, 'images/product-5.webp',
'We are proud to present this Rolex Day-Date, Ref: 228239.

This Rolex Day-Date is finished in 40mm White Gold case, White Gold Presidential Bracelet, Meteorite Dial & Diamond Baguette Hour Markers.

This truly is a stand out watch in any collection!'),

('PATEK PHILIPPE NAUTILUS', 
'Patek Phillipe', '5711/1A', 178000.00, 5, 1, 'images/product-6.webp',
'Available on request. Get in touch with the team to discuss this watch, Ref: 5711/1A. '),

('VACHERON CONSTANTIN OVERSEAS DUAL TIME', 
'Vacheron Constantin', '7900V/000R-B336', 65806.00, 5, 2, 'images/product-7.webp',
'7900V/000R-B336'),

('VACHERON CONSTANTIN FIFTYSIX DAY-DATE',
'Vacheron Constantin', '4400E/000/R-B436', 49334.00, 5, 3, 'images/product-8.webp',
'The Fiftysix collection was released in 2022. The collection features a vintage style case and modern elegant dials. The case draws design cues from the 6073, a gorgeous time piece released in 1956 - hence the name, Fiftysix. ');

INSERT INTO cart (product_id, qty) VALUES(1,1);